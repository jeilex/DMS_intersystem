<?php

namespace App\Policies;

use Illuminate\Auth\Access\Response;
use App\Models\LogisticsDocument;
use App\Models\User;

class LogisticsDocumentPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        if ($user->hasPermissionTo('View Logistics Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Logistics Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, LogisticsDocument $logisticsDocument): bool
    {
        if ($user->hasPermissionTo('View Logistics Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Logistics Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        if ($user->hasPermissionTo('Create Logistics Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Logistics Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, LogisticsDocument $logisticsDocument): bool
    {
        if ($user->hasPermissionTo('Update Logistics Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Logistics Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, LogisticsDocument $logisticsDocument): bool
    {
        if ($user->hasPermissionTo('Delete Logistics Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Logistics Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, LogisticsDocument $logisticsDocument): bool
    {
        return $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, LogisticsDocument $logisticsDocument): bool
    {
        return $user->hasAnyRole('Admin');
    }
}
