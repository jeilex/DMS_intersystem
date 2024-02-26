<?php

namespace App\Policies;

use Illuminate\Auth\Access\Response;
use App\Models\SendDocuments;
use App\Models\User;

class SendDocumentsPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        if ($user->hasPermissionTo('View Admin Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Admin Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, SendDocuments $sendDocuments): bool
    {
        if ($user->hasPermissionTo('View Admin Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Admin Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
         if ($user->hasPermissionTo('View Admin Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Admin Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, SendDocuments $sendDocuments): bool
    {
         if ($user->hasPermissionTo('Update Admin Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Admin Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, SendDocuments $sendDocuments): bool
    {
         if ($user->hasPermissionTo('Delete Admin Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Admin Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, SendDocuments $sendDocuments): bool
    {
        return $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, SendDocuments $sendDocuments): bool
    {
        return $user->hasAnyRole('Admin');
    }
}
