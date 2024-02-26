<?php

namespace App\Policies;

use Illuminate\Auth\Access\Response;
use App\Models\AccountingDocument;
use App\Models\User;

class AccountingDocumentPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        if ($user->hasPermissionTo('View Accounting Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Accounting Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, AccountingDocument $accountingDocument): bool
    {
        if ($user->hasPermissionTo('View Accounting Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Accounting Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        if ($user->hasPermissionTo('Create Accounting Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Accounting Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, AccountingDocument $accountingDocument): bool
    {
        if ($user->hasPermissionTo('Update Accounting Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Accounting Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, AccountingDocument $accountingDocument): bool
    {
        if ($user->hasPermissionTo('Delete Accounting Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Accounting Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, AccountingDocument $accountingDocument): bool
    {
        return $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, AccountingDocument $accountingDocument): bool
    {
        return $user->hasAnyRole('Admin');
    }
}
