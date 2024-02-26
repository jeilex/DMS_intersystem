<?php

namespace App\Filament\Resources\UserResource\Widgets;

use App\Models\AccountingSendDocuments;
use App\Models\SalesSendDocuments;
use App\Models\EngineeringSendDocuments;
use App\Models\LogisticsSendDocuments;
use App\Models\ProcurementSendDocuments;
use App\Models\PurchasingSendDocuments;
use App\Models\SendDocuments;
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
        ];

        $labels = [];

        $departments = [
            'Accounting' => AccountingSendDocuments::class,
            'Sales' => SalesSendDocuments::class,
            'Engineering' => EngineeringSendDocuments::class,
            'Logistics' => LogisticsSendDocuments::class,
            'Procurement' => ProcurementSendDocuments::class,
            'Purchasing' => PurchasingSendDocuments::class,
        ];

        foreach ($departments as $department => $model) {
            $rejected = $model::where('status', 'reject')->count();
            $approved = $model::where('status', 'approved')->count();
            $pending = $model::where('status', 'pending')->count();

            $chartData['rejected'][$department] = $rejected;
            $chartData['approved'][$department] = $approved;
            $chartData['pending'][$department] = $pending;

            $labels[] = $department;
        }

        return [
            'datasets' => [
                [
                    'label' => 'Rejected',
                    'data' => $chartData['rejected'],
                    'backgroundColor' => 'Red',
                    'borderColor' => 'Red',
                ],
                [
                    'label' => 'Approved',
                    'data' => $chartData['approved'],
                    'backgroundColor' => 'Green',
                    'borderColor' => 'Green',
                ],
                [
                    'label' => 'Pending',
                    'data' => $chartData['pending'],
                    'backgroundColor' => 'default',
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