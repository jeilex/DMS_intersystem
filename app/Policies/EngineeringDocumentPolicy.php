<?php

namespace App\Policies;

use Illuminate\Auth\Access\Response;
use App\Models\EngineeringDocument;
use App\Models\User;

class EngineeringDocumentPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        if ($user->hasPermissionTo('View Engineering Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Engineering Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, EngineeringDocument $engineeringDocument): bool
    {
        if ($user->hasPermissionTo('View Engineering Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Engineering Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
      if ($user->hasPermissionTo('Create Engineering Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Engineering Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, EngineeringDocument $engineeringDocument): bool
    {
      if ($user->hasPermissionTo('Update Engineering Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Engineering Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, EngineeringDocument $engineeringDocument): bool
    {
      if ($user->hasPermissionTo('Delete Engineering Documents') || $user->hasAnyRole('Admin') || $user->hasPermissionTo('CRUD Engineering Documents')) {
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, EngineeringDocument $engineeringDocument): bool
    {
        return $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, EngineeringDocument $engineeringDocument): bool
    {
        return $user->hasAnyRole('Admin');
    }
}
