<?php

namespace App\Policies;

use Illuminate\Auth\Access\Response;
use App\Models\SalesDocument;
use App\Models\User;

class SalesDocumentPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        if ($user->hasPermissionTo('View Sales Document') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Sales Document')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, SalesDocument $sendDocuments): bool
    {
        if ($user->hasPermissionTo('View Sales Document') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Sales Document')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
         if ($user->hasPermissionTo('View Sales Document') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Sales Document')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, SalesDocument $sendDocuments): bool
    {
         if ($user->hasPermissionTo('Update Sales Document') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Sales Document')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, SalesDocument $salesDocument): bool
    {
         if ($user->hasPermissionTo('Delete Sales Document') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Sales Document')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, SalesDocument $salesDocument): bool
    {
        return $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, SalesDocument $salesDocument): bool
    {
        return $user->hasAnyRole('Admin');
    }
}
