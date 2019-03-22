Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp355654ywb;
        Thu, 21 Mar 2019 23:56:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwjFovIQrl/b8uUvYqwZEFLRbA/W58bZAmaABwJ6SA/7uvasxWURSGNf8GrwFUkBIzI1q6V
X-Received: by 2002:a17:902:784d:: with SMTP id e13mr8038004pln.152.1553237799072;
        Thu, 21 Mar 2019 23:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553237799; cv=none;
        d=google.com; s=arc-20160816;
        b=gLvc1ToNaBisMxJe/HRhhTMPZPp+9KPkf4nR+xyus4ZXGyhr3TLWthP5SSslU55Elx
         /WEL4eqj8iAQzLn5X5ttGjJHaPKz4PZqmK0k1vp35XyYVLf/c2xWhnsyfEfdn1b5LYYL
         W3C10JzuDPNGxfm6ojMkmcXEnWfxL9dz1nUqwe2M2I5hXJeT0TBPW1zUHv1H38nt+YZ/
         MUNorN0X0tYofRa7j+hyk2cNy10MJyxvMjx1AECy31FA1W1ItKwJ1Ezj5Uj3odz+ha9y
         T1viETjhzFLm9nN6HMAx6UhdhydPpWaabFfSwHRRqXftj1kdBZxi0CSsJg+5ZzZzbmY8
         U+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=xwZol8WrAcSmFn+BAi9WZWGywMwF3j6u7CC3AgcEevo=;
        b=YPkwB9WrR+LRJIkynPYdMKB6s7zK0CheE9+Yy8gjsP0yc8UtppJgMDALm4i9s5E5cH
         eLin0H1lryv/9IdM7jI+OgnRCK7eVQC+4VnS50rZdGhPjHI/7Sg+9pOwlCgzCMAG6GkI
         7LWXYv8M4VtwKcN5L1EWKw9gILeQWXld9f4qxkbcX0OYrcPl7PI6WEk0G34V8hDrpw6i
         /TquKDpxT5FBWoXQ0HZTd/cdx3C1uXV1eBVacNBq/pb9g/vtrh4eWopp/0jbbsP38nYF
         Kz/zDsDZfx18R5I8JuSNJAdFm/juwsBWGmUd4myAdMzVAdGiFEdT1eKMcZ7XIvV0J5MN
         Vd0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id v17si6030371pff.214.2019.03.21.23.56.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2019 23:56:39 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8966E25E;
	Fri, 22 Mar 2019 06:56:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5EA6E25E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Mar 2019 06:56:36 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Mar 2019 23:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,255,1549958400"; 
 d="asc'?scan'208";a="129165880"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga006.jf.intel.com with ESMTP; 21 Mar 2019 23:56:35 -0700
Date: Fri, 22 Mar 2019 14:45:58 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH 3/3] drm/i915/gvt: Enable async flip on plane surface
 mmio writes
Message-ID: <20190322064558.GT10798@zhen-hp.sh.intel.com>
References: <20190320064521.31145-1-colin.xu@intel.com>
 <20190320064521.31145-4-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190320064521.31145-4-colin.xu@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0293798633=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0293798633==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="awxGVdTeoOKEHxWQ"
Content-Disposition: inline


--awxGVdTeoOKEHxWQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.20 14:45:21 +0800, Colin Xu wrote:
> According to Intel GFX PRM on 01.org, plane surface address can be updated
> synchronously or asynchronously. Synchronous flip will hold plane surface
> address update to start of next vsync, which is current implementation.
> Asynchronous flip will update the address as soon as possible. Without
> async flip, some 3D application could not reach better performance and
> the maximum performance is no higher than vsync frequency.
>=20
> The patch enables the async flip on plane surface address mmio update,
> and increment flip count correctly.
>=20
> With async flip enabled, some 3D applications have significant performance
> improvement. i.e. 3DMark Ice Storm has a 300%~400% increment on score.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display.c  |  1 -
>  drivers/gpu/drm/i915/gvt/handlers.c | 99 +++++++++++++++++++++++------
>  2 files changed, 81 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index e3f9caa7839f..e1c313da6c00 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -407,7 +407,6 @@ static void emulate_vblank_on_pipe(struct intel_vgpu =
*vgpu, int pipe)
>  		if (!pipe_is_enabled(vgpu, pipe))
>  			continue;
> =20
> -		vgpu_vreg_t(vgpu, PIPE_FLIPCOUNT_G4X(pipe))++;
>  		intel_vgpu_trigger_virtual_event(vgpu, event);
>  	}
> =20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 63418c81ef14..8f3a5a01ab7a 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -750,18 +750,26 @@ static int pri_surf_mmio_write(struct intel_vgpu *v=
gpu, unsigned int offset,
>  		void *p_data, unsigned int bytes)
>  {
>  	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> -	unsigned int index =3D DSPSURF_TO_PIPE(offset);
> -	i915_reg_t surflive_reg =3D DSPSURFLIVE(index);
> -	int flip_event[] =3D {
> -		[PIPE_A] =3D PRIMARY_A_FLIP_DONE,
> -		[PIPE_B] =3D PRIMARY_B_FLIP_DONE,
> -		[PIPE_C] =3D PRIMARY_C_FLIP_DONE,
> -	};
> +	u32 pipe =3D DSPSURF_TO_PIPE(offset);
> +	int event =3D 0;
> +
> +	if (pipe =3D=3D INVALID_PIPE || pipe > PIPE_C) {
> +		gvt_vgpu_err("Unsupported pipe-%d for PLANE_PRIMARY!\n", pipe);
> +		return 0;
> +	}
> +
> +	event =3D SKL_FLIP_EVENT(pipe, PLANE_PRIMARY);
> =20
>  	write_vreg(vgpu, offset, p_data, bytes);
> -	vgpu_vreg_t(vgpu, surflive_reg) =3D vgpu_vreg(vgpu, offset);
> +	vgpu_vreg_t(vgpu, DSPSURFLIVE(pipe)) =3D vgpu_vreg(vgpu, offset);
> +
> +	vgpu_vreg_t(vgpu, PIPE_FLIPCOUNT_G4X(pipe))++;
> +
> +	if (vgpu_vreg_t(vgpu, DSPCNTR(pipe)) & 0x200)

Could we add flip mode bit definition instead of open code like this?

> +		intel_vgpu_trigger_virtual_event(vgpu, event);
> +	else
> +		set_bit(event, vgpu->irq.flip_done_event[pipe]);
> =20
> -	set_bit(flip_event[index], vgpu->irq.flip_done_event[index]);
>  	return 0;
>  }
> =20
> @@ -771,18 +779,61 @@ static int pri_surf_mmio_write(struct intel_vgpu *v=
gpu, unsigned int offset,
>  static int spr_surf_mmio_write(struct intel_vgpu *vgpu, unsigned int off=
set,
>  		void *p_data, unsigned int bytes)
>  {
> -	unsigned int index =3D SPRSURF_TO_PIPE(offset);
> -	i915_reg_t surflive_reg =3D SPRSURFLIVE(index);
> -	int flip_event[] =3D {
> -		[PIPE_A] =3D SPRITE_A_FLIP_DONE,
> -		[PIPE_B] =3D SPRITE_B_FLIP_DONE,
> -		[PIPE_C] =3D SPRITE_C_FLIP_DONE,
> -	};
> +	u32 pipe =3D SPRSURF_TO_PIPE(offset);
> +	int event =3D 0;
> +
> +	if (pipe =3D=3D INVALID_PIPE || pipe > PIPE_C) {
> +		gvt_vgpu_err("Unsupported pipe-%d for PLANE_SPRITE0!\n", pipe);
> +		return 0;
> +	}
> +
> +	event =3D SKL_FLIP_EVENT(pipe, PLANE_SPRITE0);
> +
> +	write_vreg(vgpu, offset, p_data, bytes);
> +	vgpu_vreg_t(vgpu, SPRSURFLIVE(pipe)) =3D vgpu_vreg(vgpu, offset);
> +
> +	if (vgpu_vreg_t(vgpu, SPRCTL(pipe)) & 0x200)

ditto

> +		intel_vgpu_trigger_virtual_event(vgpu, event);
> +	else
> +		set_bit(event, vgpu->irq.flip_done_event[pipe]);
> +
> +	return 0;
> +}
> +
> +static int reg50080_mmio_write(struct intel_vgpu *vgpu,
> +			       unsigned int offset, void *p_data,
> +			       unsigned int bytes)
> +{
> +	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> +	enum pipe pipe =3D REG_50080_TO_PIPE(offset);
> +	enum plane_id plane =3D REG_50080_TO_PLANE(offset);
> +	int event =3D 0;
> +
> +	if (plane !=3D PLANE_PRIMARY && plane !=3D PLANE_SPRITE0) {
> +		gvt_vgpu_err("Unsupported plane-%d!\n", plane);
> +		return 0;
> +	}
> +
> +	if (pipe =3D=3D INVALID_PIPE || pipe > PIPE_C) {
> +		gvt_vgpu_err("Unsupported pipe-%d for plane-%d!\n", pipe, plane);
> +		return 0;
> +	}
> +
> +	event =3D SKL_FLIP_EVENT(pipe, plane);
> =20
>  	write_vreg(vgpu, offset, p_data, bytes);
> -	vgpu_vreg_t(vgpu, surflive_reg) =3D vgpu_vreg(vgpu, offset);
> +	if (plane =3D=3D PLANE_PRIMARY) {
> +		vgpu_vreg_t(vgpu, DSPSURFLIVE(pipe)) =3D vgpu_vreg(vgpu, offset);
> +		vgpu_vreg_t(vgpu, PIPE_FLIPCOUNT_G4X(pipe))++;
> +	} else {
> +		vgpu_vreg_t(vgpu, SPRSURFLIVE(pipe)) =3D vgpu_vreg(vgpu, offset);
> +	}
> +
> +	if ((vgpu_vreg(vgpu, offset) & 0x3) =3D=3D 1)

and this

> +		intel_vgpu_trigger_virtual_event(vgpu, event);
> +	else
> +		set_bit(event, vgpu->irq.flip_done_event[pipe]);
> =20
> -	set_bit(flip_event[index], vgpu->irq.flip_done_event[index]);
>  	return 0;
>  }
> =20
> @@ -1969,6 +2020,8 @@ static int init_generic_mmio_info(struct intel_gvt =
*gvt)
>  	MMIO_DH(DSPSURF(PIPE_A), D_ALL, NULL, pri_surf_mmio_write);
>  	MMIO_D(DSPOFFSET(PIPE_A), D_ALL);
>  	MMIO_D(DSPSURFLIVE(PIPE_A), D_ALL);
> +	MMIO_DH(REG_50080(PIPE_A, PLANE_PRIMARY), D_ALL, NULL,
> +		reg50080_mmio_write);
> =20
>  	MMIO_D(DSPCNTR(PIPE_B), D_ALL);
>  	MMIO_D(DSPADDR(PIPE_B), D_ALL);
> @@ -1978,6 +2031,8 @@ static int init_generic_mmio_info(struct intel_gvt =
*gvt)
>  	MMIO_DH(DSPSURF(PIPE_B), D_ALL, NULL, pri_surf_mmio_write);
>  	MMIO_D(DSPOFFSET(PIPE_B), D_ALL);
>  	MMIO_D(DSPSURFLIVE(PIPE_B), D_ALL);
> +	MMIO_DH(REG_50080(PIPE_B, PLANE_PRIMARY), D_ALL, NULL,
> +		reg50080_mmio_write);
> =20
>  	MMIO_D(DSPCNTR(PIPE_C), D_ALL);
>  	MMIO_D(DSPADDR(PIPE_C), D_ALL);
> @@ -1987,6 +2042,8 @@ static int init_generic_mmio_info(struct intel_gvt =
*gvt)
>  	MMIO_DH(DSPSURF(PIPE_C), D_ALL, NULL, pri_surf_mmio_write);
>  	MMIO_D(DSPOFFSET(PIPE_C), D_ALL);
>  	MMIO_D(DSPSURFLIVE(PIPE_C), D_ALL);
> +	MMIO_DH(REG_50080(PIPE_C, PLANE_PRIMARY), D_ALL, NULL,
> +		reg50080_mmio_write);
> =20
>  	MMIO_D(SPRCTL(PIPE_A), D_ALL);
>  	MMIO_D(SPRLINOFF(PIPE_A), D_ALL);
> @@ -2000,6 +2057,8 @@ static int init_generic_mmio_info(struct intel_gvt =
*gvt)
>  	MMIO_D(SPROFFSET(PIPE_A), D_ALL);
>  	MMIO_D(SPRSCALE(PIPE_A), D_ALL);
>  	MMIO_D(SPRSURFLIVE(PIPE_A), D_ALL);
> +	MMIO_DH(REG_50080(PIPE_A, PLANE_SPRITE0), D_ALL, NULL,
> +		reg50080_mmio_write);
> =20
>  	MMIO_D(SPRCTL(PIPE_B), D_ALL);
>  	MMIO_D(SPRLINOFF(PIPE_B), D_ALL);
> @@ -2013,6 +2072,8 @@ static int init_generic_mmio_info(struct intel_gvt =
*gvt)
>  	MMIO_D(SPROFFSET(PIPE_B), D_ALL);
>  	MMIO_D(SPRSCALE(PIPE_B), D_ALL);
>  	MMIO_D(SPRSURFLIVE(PIPE_B), D_ALL);
> +	MMIO_DH(REG_50080(PIPE_B, PLANE_SPRITE0), D_ALL, NULL,
> +		reg50080_mmio_write);
> =20
>  	MMIO_D(SPRCTL(PIPE_C), D_ALL);
>  	MMIO_D(SPRLINOFF(PIPE_C), D_ALL);
> @@ -2026,6 +2087,8 @@ static int init_generic_mmio_info(struct intel_gvt =
*gvt)
>  	MMIO_D(SPROFFSET(PIPE_C), D_ALL);
>  	MMIO_D(SPRSCALE(PIPE_C), D_ALL);
>  	MMIO_D(SPRSURFLIVE(PIPE_C), D_ALL);
> +	MMIO_DH(REG_50080(PIPE_C, PLANE_SPRITE0), D_ALL, NULL,
> +		reg50080_mmio_write);
> =20
>  	MMIO_D(HTOTAL(TRANSCODER_A), D_ALL);
>  	MMIO_D(HBLANK(TRANSCODER_A), D_ALL);
> --=20
> 2.21.0
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--awxGVdTeoOKEHxWQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXJSEpgAKCRCxBBozTXgY
J6OBAJ9V74YmafmdJg4UE8O1FJBofiuCvQCggy2BQ95/+pRQ18t/5jghyffMoUE=
=LUvG
-----END PGP SIGNATURE-----

--awxGVdTeoOKEHxWQ--

--===============0293798633==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0293798633==--
