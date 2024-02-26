<?php

namespace App\Filament\Resources\AdminResource\Widgets;

use App\Models\User;
use App\Models\AccountingDocument;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;

class StatsOverview extends BaseWidget
{
    protected function getStats(): array
    {
        return [
            Stat::make('Users', User::query()->count())
            ->description('Total Users')
            ->descriptionIcon('heroicon-m-arrow-trending-up')
            ->chart([7, 2, 10, 3, 15, 4, 17])
            ->color('success'),
            // Stat::make('Documents Approved', Document::where('status', 'approved')->count())
            // ->description('12 new')
            // ->description('32k increase')
            // ->descriptionIcon('heroicon-m-arrow-trending-up')
            // ->chart([7, 2, 10, 3, 15, 4, 17])
            // ->color('success'),
            // Stat::make('Documents Pending', '192.1k')
            // ->description('32k increase')
            // ->descriptionIcon('heroicon-m-arrow-trending-up')
            // ->chart([7, 2, 10, 3, 15, 4, 17])
            // ->color('success'),
            // Stat::make('Documents Reject', '192.1k')
            // ->description('32k increase')
            // ->descriptionIcon('heroicon-m-arrow-trending-up')
            // ->chart([7, 2, 10, 3, 15, 4, 17])
            // ->color('danger'),
        
        ];
    }
}
