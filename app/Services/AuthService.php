<?php



class AuthService
{
    public function register(array $data): array
    {
        $data = $this->normalizeRegisterData($data);
        $errors = $this->validateRegisterData($data);

        if (!empty($errors)) {
            return [
                'success' => false,
                'errors' => $errors,
            ];
        }

        try {
            $user = db_transaction(function () use ($data) {
                $userId = User::create([
                    'role' => $data['role'],
                    'full_name' => $data['full_name'],
                    'email' => $data['email'],
                    'password' => $data['password'],
                    'phone' => $data['phone'],
                    'whatsapp_phone' => $data['whatsapp_phone'],
                    'province_id' => $data['province_id'],
                    'district_id' => $data['district_id'],
                    'address_text' => $data['address_text'],
                    'status' => USER_STATUS_ACTIVE,
                ]);

                if ($data['role'] === ROLE_PRODUCER) {
                    ProducerProfile::create($userId, [
                        'store_name' => $data['store_name'],
                        'description' => $data['description'],
                        'contact_email' => $data['email'],
                        'contact_phone' => $data['phone'],
                        'contact_whatsapp' => $data['whatsapp_phone'],
                    ]);
                } else {
                    ConsumerProfile::create($userId);
                }

                Wallet::createForUser($userId);

                return User::findById($userId);
            });

            return [
                'success' => true,
                'user' => $user,
            ];
        } catch (Throwable $e) {
            return [
                'success' => false,
                'errors' => [
                    'general' => ['Kayıt sırasında bir hata oluştu.'],
                ],
            ];
        }
    }

    public function login(string $email, string $password): array
    {
        $email = mb_strtolower(trim($email), 'UTF-8');
        $password = trim($password);

        $errors = [];

        if ($email === '') {
            $errors['email'][] = 'E-posta alanı zorunludur.';
        }

        if ($password === '') {
            $errors['password'][] = 'Şifre alanı zorunludur.';
        }

        if (!empty($errors)) {
            return [
                'success' => false,
                'errors' => $errors,
            ];
        }

        $user = User::findByEmail($email);

        if (!$user || !password_verify($password, $user['password_hash'])) {
            return [
                'success' => false,
                'errors' => [
                    'general' => ['E-posta veya şifre hatalı.'],
                ],
            ];
        }

        if ($user['status'] !== USER_STATUS_ACTIVE) {
            return [
                'success' => false,
                'errors' => [
                    'general' => ['Hesabınız aktif değil.'],
                ],
            ];
        }

        User::updateLastLogin((int) $user['id']);

        $user = User::findById((int) $user['id']);

        return [
            'success' => true,
            'user' => $user,
        ];
    }

    public function redirectPathForUser(array $user): string
{
    return match ($user['role']) {
        ROLE_PRODUCER => 'producer/dashboard.php',
        default => 'index.php',
    };
    }

    private function normalizeRegisterData(array $data): array
    {
        return [
            'role' => $data['role'] ?? ROLE_CONSUMER,
            'full_name' => trim($data['full_name'] ?? ''),
            'email' => mb_strtolower(trim($data['email'] ?? ''), 'UTF-8'),
            'password' => trim($data['password'] ?? ''),
            'password_confirmation' => trim($data['password_confirmation'] ?? ''),
            'phone' => trim($data['phone'] ?? '') ?: null,
            'whatsapp_phone' => trim($data['whatsapp_phone'] ?? '') ?: null,
            'province_id' => !empty($data['province_id']) ? (int) $data['province_id'] : null,
            'district_id' => !empty($data['district_id']) ? (int) $data['district_id'] : null,
            'address_text' => trim($data['address_text'] ?? '') ?: null,
            'store_name' => trim($data['store_name'] ?? ''),
            'description' => trim($data['description'] ?? '') ?: null,
        ];
    }

    private function validateRegisterData(array $data): array
    {
        $errors = [];

        if (!in_array($data['role'], [ROLE_CONSUMER, ROLE_PRODUCER], true)) {
            $errors['role'][] = 'Geçerli bir rol seçmelisiniz.';
        }

        if ($data['full_name'] === '') {
            $errors['full_name'][] = 'Ad soyad alanı zorunludur.';
        }

        if ($data['email'] === '') {
            $errors['email'][] = 'E-posta alanı zorunludur.';
        } elseif (!validate_email($data['email'])) {
            $errors['email'][] = 'Geçerli bir e-posta adresi giriniz.';
        } elseif (User::emailExists($data['email'])) {
            $errors['email'][] = 'Bu e-posta adresi zaten kayıtlı.';
        }

        if ($data['password'] === '') {
            $errors['password'][] = 'Şifre alanı zorunludur.';
        } elseif (!validate_min_length($data['password'], 6)) {
            $errors['password'][] = 'Şifre en az 6 karakter olmalıdır.';
        }

        if ($data['password'] !== $data['password_confirmation']) {
            $errors['password_confirmation'][] = 'Şifre tekrarı eşleşmiyor.';
        }

        if ($data['role'] === ROLE_PRODUCER && $data['store_name'] === '') {
            $errors['store_name'][] = 'Üretici hesabı için market/çiftlik adı zorunludur.';
        }

        return $errors;
    }
}