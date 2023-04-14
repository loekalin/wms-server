<?php 

namespace App\Enums;

enum UserRoleEnum: string {

    case ADMIN = 'admin';
    case USER = 'user';

    public function isAdmin(): bool {
        return $this === self::ADMIN;
    }
    
    public function isUser(): bool {
        return $this === self::USER;
    }

}


?>