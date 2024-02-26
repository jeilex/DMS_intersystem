<?php

namespace App\Policies;

use Illuminate\Auth\Access\Response;
use App\Models\PurchasingSendDocuments;
use App\Models\User;

class PurchasingSendDocumentsPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        if ($user->hasPermissionTo('View Purchasing Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Purchasing Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, PurchasingSendDocuments $purchasingSendDocuments): bool
    {
        if ($user->hasPermissionTo('View Purchasing Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Purchasing Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        if ($user->hasPermissionTo('Create Purchasing Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Purchasing Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, PurchasingSendDocuments $purchasingSendDocuments): bool
    {
        if ($user->hasPermissionTo('Update Purchasing Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Purchasing Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, PurchasingSendDocuments $purchasingSendDocuments): bool
    {
        if ($user->hasPermissionTo('Delete Purchasing Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Purchasing Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, PurchasingSendDocuments $purchasingSendDocuments): bool
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, PurchasingSendDocuments $purchasingSendDocuments): bool
    {
        //
    }
}
