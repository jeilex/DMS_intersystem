<?php

namespace App\Policies;

use Illuminate\Auth\Access\Response;
use App\Models\ProcurementSendDocuments;
use App\Models\User;

class ProcurementSendDocumentsPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        if ($user->hasPermissionTo('View Procurement Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Procurement Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, ProcurementSendDocuments $procurementSendDocuments): bool
    {
        if ($user->hasPermissionTo('View Procurement Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Procurement Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        if ($user->hasPermissionTo('Create Procurement Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Procurement Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, ProcurementSendDocuments $procurementSendDocuments): bool
    {
        if ($user->hasPermissionTo('Update Procurement Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Procurement Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, ProcurementSendDocuments $procurementSendDocuments): bool
    {
        if ($user->hasPermissionTo('Delete Procurement Send Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Procurement Send Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, ProcurementSendDocuments $procurementSendDocuments): bool
    {
        return $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, ProcurementSendDocuments $procurementSendDocuments): bool
    {
        return $user->hasAnyRole('Admin');
    }
}
