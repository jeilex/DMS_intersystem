<?php

namespace App\Policies;

use Illuminate\Auth\Access\Response;
use App\Models\Documents;
use App\Models\User;

class DocumentsPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        if ($user->hasPermissionTo('View Admin Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Admin Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, Documents $documents): bool
    {
        if ($user->hasPermissionTo('View Admin Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Admin Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        if ($user->hasPermissionTo('Create Admin Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Admin Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, Documents $documents): bool
    {
        if ($user->hasPermissionTo('Update Admin Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Admin Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, Documents $documents): bool
    {
        if ($user->hasPermissionTo('Delete Admin Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Admin Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, Documents $documents): bool
    {
        return $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, Documents $documents): bool
    {
        return $user->hasAnyRole('Admin');
    }
}
