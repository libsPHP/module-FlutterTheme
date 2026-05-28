<?php
/**
 * Canonical Resolver Interface
 *
 * @category    NativeMind
 * @package     NativeMind_Bridge
 */

declare(strict_types=1);

namespace NativeMind\Bridge\Api;

interface CanonicalResolverInterface
{
    /**
     * Resolve canonical URL for current page
     *
     * @return string|null Canonical URL or null if not applicable
     */
    public function resolve(): ?string;

    /**
     * Check if this resolver handles current page type
     *
     * @return bool
     */
    public function canResolve(): bool;
}
