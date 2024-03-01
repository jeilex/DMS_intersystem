<?php

namespace App\Policies;


use App\Models\SalesSendDocuments;
use App\Models\User;
use Spatie\Permission\Models\Permission;

class SalesSendDocumentsPolicy
{
    /**
     * Determine whether the user can view any models.
     *
     * @param  \App\Models\User  $user
     * @return bool
     */
    public function viewAny(User $user)
    {
        return $user->hasPermissionTo('View Sales Send Documents') || $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can view the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\SalesSendDocuments  $salesSendDocuments
     * @return bool
     */
    public function view(User $user, SalesSendDocuments $salesSendDocuments)
    {
        return $user->hasPermissionTo('View Sales Send Documents') || $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can create models.
     *
     * @param  \App\Models\User  $user
     * @return bool
     */
    public function create(User $user)
    {
        return $user->hasPermissionTo('Create Sales Send Documents') || $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\SalesSendDocuments  $salesSendDocuments
     * @return bool
     */
    public function update(User $user, SalesSendDocuments $salesSendDocuments)
    {
        return $user->hasPermissionTo('Update Sales Send Documents') || $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\SalesSendDocuments  $salesSendDocuments
     * @return bool
     */
    public function delete(User $user, SalesSendDocuments $salesSendDocuments)
    {
        return $user->hasPermissionTo('Delete Sales Send Documents') || $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\SalesSendDocuments  $salesSendDocuments
     * @return bool
     */
    public function restore(User $user, SalesSendDocuments $salesSendDocuments)
    {
        return $user->hasAnyRole('Admin');
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\SalesSendDocuments  $salesSendDocuments
     * @return bool
     */
    public function forceDelete(User $user, SalesSendDocuments $salesSendDocuments)
    {
        return $user->hasAnyRole('Admin');
    }
}