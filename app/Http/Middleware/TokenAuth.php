<?php

namespace App\Http\Middleware;

use Closure;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use App\Models\Enforcer;
use JWTAuth;

class TokenAuth extends BaseAuthMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (! $token = $this->auth->setRequest($request)->getToken()) {
            return $this->respond('tymon.jwt.absent', 'token_not_provided', 400);
        }

    	$enforcer_id = JWTAuth::getPayload(JWTAuth::getToken())->get('sub');
        $enforcer = Enforcer::findOrFail($enforcer_id);

        $this->events->fire('tymon.jwt.valid', $enforcer);

        return $next($request);
    }
}
