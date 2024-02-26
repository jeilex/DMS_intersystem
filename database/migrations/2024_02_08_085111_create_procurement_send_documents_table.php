<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('procurement_send_documents', function (Blueprint $table) {
            $table->id();
            $table->json('upload_documents', 2048);
            $table->string('from', 2048);
            $table->string('forward', 2048)->nullable();
            $table->string('message', 2048)->nullable();
            $table->string('remarks', 2048)->nullable();
            $table->string('status')->default('pending');
            $table->datetime('published_at');
            $table->foreignIdFor(\App\Models\User::class, 'user_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('procurement_send_documents');
    }
};
