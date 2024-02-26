<?php

namespace App\Policies;

use Illuminate\Auth\Access\Response;
use App\Models\ProcurementDocument;
use App\Models\User;

class ProcurementDocumentPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        if ($user->hasPermissionTo('View Procurement Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Procurement Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, ProcurementDocument $procurementDocument): bool
    {
        if ($user->hasPermissionTo('View Procurement Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Procurement Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        if ($user->hasPermissionTo('Create Procurement Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Procurement Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, ProcurementDocument $procurementDocument): bool
    {
        if ($user->hasPermissionTo('Create Procurement Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Procurement Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, ProcurementDocument $procurementDocument): bool
    {
        if ($user->hasPermissionTo('Delete Procurement Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Procurement Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, ProcurementDocument $procurementDocument): bool
    {
        return $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, ProcurementDocument $procurementDocument): bool
    {
        return $user->hasAnyRole('Admin');
    }
}
