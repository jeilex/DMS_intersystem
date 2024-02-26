<?php

namespace App\Policies;

use Illuminate\Auth\Access\Response;
use App\Models\SalesSendDocuments;
use App\Models\User;

class SalesSendDocumentsPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        if ($user->hasPermissionTo('View Sales Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Sales Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, SalesSendDocuments $salesSendDocuments): bool
    {
        if ($user->hasPermissionTo('View Sales Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Sales Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        if ($user->hasPermissionTo('Create Sales Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Sales Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, SalesSendDocuments $salesSendDocuments): bool
    {
        if ($user->hasPermissionTo('Update Sales Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Sales Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, SalesSendDocuments $salesSendDocuments): bool
    {
        if ($user->hasPermissionTo('Delete Sales Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Sales Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, SalesSendDocuments $salesSendDocuments): bool
    {
        return $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, SalesSendDocuments $salesSendDocuments): bool
    {
        return $user->hasAnyRole('Admin');
    }
}
