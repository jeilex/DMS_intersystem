<?php

namespace App\Models;


use Spatie\Activitylog\LogOptions;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Documents extends Model
{
    use HasFactory;
   

    use LogsActivity;

    protected $fillable = [
        'upload_documents',
        'from',
        'message',
        'forward',
        'published_at',
        'user_id',
        'remarks',
        'status',
      
    ];

  
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
        ->logOnly(['upload_documents', 'from', 'forward', 'message']);
    }

    protected $casts = [
        'upload_documents' => 'json',
    ];

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (Auth::check()) {
                $model->from = Auth::user()->name;
            }

     });
        // Listen for the creating event to automatically set the user_id attribute
        static::creating(function ($model) {
            if (Auth::check()) {
                $model->user_id = Auth::id();
            }
        });

        // Set the published_at attribute before creating the record
        static::creating(function ($model) {
            $model->published_at = now()->timezone('Asia/Manila')->toDateTimeString();
        });
    }
}
