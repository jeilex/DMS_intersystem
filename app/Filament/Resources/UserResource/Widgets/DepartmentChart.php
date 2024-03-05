<?php

namespace App\Filament\Resources\UserResource\Widgets;

use App\Models\AccountingSendDocuments;
use App\Models\SalesSendDocuments;
use App\Models\EngineeringSendDocuments;
use App\Models\LogisticsSendDocuments;
use App\Models\ProcurementSendDocuments;
use App\Models\PurchasingSendDocuments;
use App\Models\SendDocuments;
use App\Models\Documents;
use Filament\Widgets\ChartWidget;

class DepartmentChart extends ChartWidget
{
    protected static ?string $heading = 'Departments Status';
    protected int | string | array $columnSpan = 'full';
    protected static ?string $maxHeight = '300px';

    protected function getData(): array
    {
        $chartData = [
            'rejected' => [],
            'approved' => [],
            'pending' => [],
            'revised' => [],
        ];

        $labels = [];

        $departments = [
            'Accounting' => AccountingSendDocuments::class,
            'Sales' => SalesSendDocuments::class,
            'Admin' => Documents::class,
            'Engineering' => EngineeringSendDocuments::class,
            'Logistics' => LogisticsSendDocuments::class,
            'Procurement' => ProcurementSendDocuments::class,
            'Purchasing' => PurchasingSendDocuments::class,
        ];

        foreach ($departments as $department => $model) {
            $rejected = $model::where('status', 'reject')->count();
            $approved = $model::where('status', 'approved')->count();
            $pending = $model::where('status', 'pending')->count();
            $revised = $model::where('status', 'revised')->count();

            $chartData['rejected'][$department] = $rejected;
            $chartData['approved'][$department] = $approved;
            $chartData['pending'][$department] = $pending;
            $chartData['revised'][$department] = $revised;

            $labels[] = $department;
        }

        return [
            'datasets' => [
                [
                    'label' => 'Pending',
                    'data' => $chartData['pending'],
                    'backgroundColor' => 'Default',
                ],
                
                [
                    'label' => 'Approved',
                    'data' => $chartData['approved'],
                    'backgroundColor' => 'Green',
                    'borderColor' => 'Green',
                ],
                [
                    'label' => 'Rejected',
                    'data' => $chartData['rejected'],
                    'backgroundColor' => 'Red',
                    'borderColor' => 'Red',
                ],
                [
                    'label' => 'Revised',
                    'data' => $chartData['revised'],
                    'backgroundColor' => 'Gray',
                    'borderColor' => 'Gray',
                ],
            ],
            
            'labels' => $labels,
        ];
    }

    protected function getFilters(): ?array
    {
        $years = range(now()->year, now()->subYears(10)->year);

        $filterOptions = [];

        foreach ($years as $year) {
            $filterOptions[$year] = $year;
        }

        return [
            'year' => 'Select Year',
        ];
    }

    protected function getType(): string
    {
        return 'bar';
    }
}