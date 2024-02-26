<?php

namespace App\Policies;

use Illuminate\Auth\Access\Response;
use App\Models\PurchasingDocument;
use App\Models\User;

class PurchasingDocumentPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        if ($user->hasPermissionTo('View Purchasing Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Purchasing Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, PurchasingDocument $purchasingDocument): bool
    {
        if ($user->hasPermissionTo('View Purchasing Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Purchasing Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        if ($user->hasPermissionTo('Create Purchasing Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Purchasing Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, PurchasingDocument $purchasingDocument): bool
    {
        if ($user->hasPermissionTo('Update Purchasing Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Purchasing Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, PurchasingDocument $purchasingDocument): bool
    {
        if ($user->hasPermissionTo('Delete Purchasing Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Purchasing Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, PurchasingDocument $purchasingDocument): bool
    {
        return $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, PurchasingDocument $purchasingDocument): bool
    {
        return $user->hasAnyRole('Admin');
    }
}
