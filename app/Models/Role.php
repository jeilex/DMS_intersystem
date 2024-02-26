<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role as ModelsRole;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;


class Role extends ModelsRole
{
    use HasFactory;
    use LogsActivity;

    protected $fillable = [
        // 'name',
        // 'email',
        // 'password',
        // 'role',
        // 'roles_id',
        // // 'department',
        // 'permission',
      
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['upload_documents', 'from', 'recipient', 'message']);
    }
}