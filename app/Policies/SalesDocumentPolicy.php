<?php

namespace App\Policies;

use Illuminate\Auth\Access\Response;
use App\Models\SalesDocuments;
use App\Models\User;

class SalesDocumentsPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        if ($user->hasPermissionTo('View Sales Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Sales Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, SalesDocuments $sendDocuments): bool
    {
        if ($user->hasPermissionTo('View Sales Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Sales Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
         if ($user->hasPermissionTo('View Sales Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Sales Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, SalesDocuments $sendDocuments): bool
    {
         if ($user->hasPermissionTo('Update Sales Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Sales Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, SalesDocuments $salesDocuments): bool
    {
         if ($user->hasPermissionTo('Delete Sales Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Sales Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, SalesDocuments $salesDocuments): bool
    {
        return $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, SalesDocuments $salesDocuments): bool
    {
        return $user->hasAnyRole('Admin');
    }
}
