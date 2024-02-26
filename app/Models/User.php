<?php

namespace App\Models;
// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Filament\Panel;
use App\Models\Role;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Activitylog\LogOptions;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Notifications\Notifiable;
use Filament\Models\Contracts\FilamentUser;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable implements FilamentUser

{
    use HasApiTokens, HasFactory, Notifiable, HasRoles;
    use LogsActivity;

   
    public function isAdmin()
    {
        return $this->role === '1' || $this->role === '2'; // Check if role is either '1' or '2'

        
    }

 
    
    const ROLE_ADMIN = 'ADMIN';
    const ROLE_USER = 'USER';
    const DEPARTMENT_HEAD ='DEPARTMENT HEAD';
    const SALES = 'SALES';
    const ENGINEERING = 'ENGINEERING';
    const PROCUREMENT = 'PROCUREMENT';
    const PURCHASING = 'PURCHASING';
    const LOGISTICS = 'LOGISTICS';
    const ACCOUNTING ='ACCOUNTING';

const ROLES = [
    self::ROLE_ADMIN => 'Admin',
    self::ROLE_USER => 'User',
    self::DEPARTMENT_HEAD => 'Department Head',
    self::SALES => 'Sales',
    self::ENGINEERING => 'Engineering',
    self::PROCUREMENT => 'Procurement',
    self::PURCHASING => 'Purchasing',
    self::LOGISTICS => 'Logistics',
    self::ACCOUNTING => 'Accounting'

  
];

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'role',
        'role_id',
        'department',
        'permission',
        'user_id',
        'from',
      
    ];


    
    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $visible = [
        'id',
        'name',
        'department',
        'email',
        'created_at',
        'updated_at',
        'user_id',
        'from',
        
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];


    public function canAccessPanel(Panel $panel): bool
    {
        return str_ends_with($this->email, '@gmail.com');
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['name', 'email', 'department']);
    }

    public function canAccessFilament(): bool
    {
        return $this->hasRole(['Admin', 'Department Head', 'Department Staff']);
    }

    
    protected static function boot()
    {
        parent::boot();

       
        // Set the published_at attribute before creating the record
        static::creating(function ($model) {
            $model->created_at = now()->timezone('Asia/Manila')->toDateTimeString();
        });

        static::saving(function ($user) {
            if ($user->isDirty(['name', 'email', 'password', 'department', 'role', 'permission'])) {
                $user->updated_at = now()->timezone('Asia/Manila')->toDateTimeString();
            }
        });
    }

  
}
