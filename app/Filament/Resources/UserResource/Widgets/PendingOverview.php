<?php

namespace App\Filament\Resources\UserResource\Widgets;

use App\Models\User;
use App\Models\Documents;
use App\Models\SendDocuments;
use App\Models\SalesDocument;
use App\Models\LogisticsDocument;
use App\Models\AccountingDocument;
use App\Models\PurchasingDocument;
use App\Models\EngineeringDocument;
use App\Models\ProcurementDocument;
use App\Models\SalesSendDocuments;
use App\Models\LogisticsSendDocuments;
use App\Models\AccountingSendDocuments;
use App\Models\PurchasingSendDocuments;
use App\Models\EngineeringSendDocuments;
use App\Models\ProcurementSendDocuments;
use League\CommonMark\Node\Block\Document;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;


class PendingOverview extends BaseWidget
{
    
    
    protected function getStats(): array
    {
        $rejectedCount = 0;
        $pendingCount = 0;
        $approvedCount = 0;
        $revisedCount = 0;
        
        // AccountingSendDocuments
        $rejectedCount += AccountingSendDocuments::where('status', 'reject')->count();
        $pendingCount += AccountingSendDocuments::where('status', 'pending')->count();
        $revisedCount += AccountingSendDocuments::where('status', 'revised')->count();
        
        // SalesSendDocuments
        $rejectedCount += SalesSendDocuments::where('status', 'reject')->count();
        $pendingCount += SalesSendDocuments::where('status', 'pending')->count();
        $revisedCount += SalesSendDocuments::where('status', 'revised')->count();
        
        // EngineeringSendDocuments
        $rejectedCount += EngineeringSendDocuments::where('status', 'reject')->count();
        $pendingCount += EngineeringSendDocuments::where('status', 'pending')->count();
        $revisedCount += EngineeringSendDocuments::where('status', 'revised')->count();
        
        // LogisticsSendDocuments
        $rejectedCount += LogisticsSendDocuments::where('status', 'reject')->count();
        $pendingCount += LogisticsSendDocuments::where('status', 'pending')->count();
        $revisedCount += LogisticsSendDocuments::where('status', 'revised')->count();
        
        // ProcurementSendDocuments
        $rejectedCount += ProcurementSendDocuments::where('status', 'reject')->count();
        $pendingCount += ProcurementSendDocuments::where('status', 'pending')->count();
        $revisedCount += ProcurementSendDocuments::where('status', 'revised')->count();
        
        // PurchasingSendDocuments
        $rejectedCount += PurchasingSendDocuments::where('status', 'reject')->count();
        $pendingCount += PurchasingSendDocuments::where('status', 'pending')->count();
        $revisedCount += PurchasingSendDocuments::where('status', 'revised')->count();
        
        // SendDocuments
        $rejectedCount += SendDocuments::where('status', 'reject')->count();
        $pendingCount += SendDocuments::where('status', 'pending')->count();
        $revisedCount += SendDocuments::where('status', 'revised')->count();

        // AccountingDocument
   
        $approvedCount += AccountingSendDocuments::where('status', 'approved')->count();

        // SalesSendDocument
   
        $approvedCount += SalesSendDocuments::where('status', 'approved')->count();

        // Document
   
        $approvedCount += Documents::where('status', 'approved')->count();

        // EngineeringDocument
     
        $approvedCount += EngineeringSendDocuments::where('status', 'approved')->count();

        // LogisticsDocument
   
        $approvedCount += LogisticsSendDocuments::where('status', 'approved')->count();

        // ProcurementDocuments
  
        $approvedCount += ProcurementSendDocuments::where('status', 'approved')->count();

        // PurchasingDocument
  
        $approvedCount += PurchasingSendDocuments::where('status', 'approved')->count();

        
        
       

        return [
            Stat::make('Pending Documents', $pendingCount)
                ->description('Total Pending Documents')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->chart([$pendingCount, 0, 0, 0, 0, 0]) // Chart showing only pending count for simplicity
                ->color('warning'),
                
        
            Stat::make('Approved Documents', $approvedCount)
                ->description('Total Approved Documents')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->chart([$approvedCount, 0, 0, 0, 0, 0]) // Chart showing only approved count for simplicity
                ->color('success'),
        
            Stat::make('Rejected Documents', $rejectedCount)
                ->description('Total Rejected Documents')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->chart([$rejectedCount, 0, 0, 0, 0, 0]) // Chart showing only reject count for simplicity
                ->color('danger'),
                
            Stat::make('Revised Documents', $revisedCount)
                ->description('Total Revised Documents')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->chart([$revisedCount, 0, 0, 0, 0, 0]) // Chart showing only revised count for simplicity
                ->color('gray '),
        ];
    }
}
