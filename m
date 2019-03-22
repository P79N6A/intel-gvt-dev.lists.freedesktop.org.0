Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp339509ywb;
        Thu, 21 Mar 2019 23:32:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwO6aT0Eebf+jWpJqrGzqX0W0HVXEAg/Fe1qN6ttDUjbFueeV4p5skVqHw/AvthPt7Ydm5h
X-Received: by 2002:a17:902:8c8a:: with SMTP id t10mr7949972plo.160.1553236323736;
        Thu, 21 Mar 2019 23:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553236323; cv=none;
        d=google.com; s=arc-20160816;
        b=CscRezmFy6S61bpFXc5VFOLHVJ9XRdh484A2rmWVNSrCUwwiV9s0k79vurfYaC1L0T
         +ew6gM+12w6tf6B8g/GODofKQQqlUjsZwjNApWNaR8JptFKCnnLP8WpCMqT4Egh9eQX9
         Ip9ILBraXMaZWCKrkrzlv6KVPD8l5Bp8lg++u/FVNZdtul92KJvIZbdHy+MZ0KSu+Jwk
         mUugStHTYwREwrjAjcNdhPXZPr52SS5U0hJCE3Lk8pBOplua+cfzsBg3LPAsPVmym6Kj
         pc9n6yf7/Ax2hgHOitvZcrD75ATO0A/LmcTmTFCe2X2IhfimiJAqw/xmETdRM1YWUXyj
         GBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=qsh1yM5eLX78pUP3vH5Ej4TJIxK8Df+aB0kKxzvkmdk=;
        b=K85D809n0/4SeDq8ps72Il9QOEC5YSFNNC2IRKUw/a7uPGaIW2o8lmw2lWwoCCmAbT
         GDmM8h8QnT2+p2jSB7SkoHbdp6yof4zy4cTcTbiXiOHv9RNXquQYFt5NUlEEuGz+MMpb
         geZe6jExr0LMQeXQ6k3YoWKHMY9Y9NkFNDW4hous4HIQAlx4h1d8AZ9RUWGBifXvYskn
         7o2HOvM2iGUjE6FrzmKSwtUiVKuw0+8qnPLvb/s50EIhFLezwcYYlJlsuNlBR5LCXTdL
         jJI2WC2wwI8rLXzGz3FL5bJpivKd+9IVNEsumxTXeYMvxPqUWDTziJcDGytK7EVByWwE
         J3ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 23si4693377pfi.106.2019.03.21.23.32.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2019 23:32:03 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576226E25A;
	Fri, 22 Mar 2019 06:32:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02AB6E24E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Mar 2019 06:32:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Mar 2019 23:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,255,1549958400"; 
 d="asc'?scan'208";a="284866655"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga004.jf.intel.com with ESMTP; 21 Mar 2019 23:31:59 -0700
Date: Fri, 22 Mar 2019 14:21:23 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH 2/6] drm/i915/gvt: Prevent invalid ring_id access to
 array regs[]
Message-ID: <20190322062123.GS10798@zhen-hp.sh.intel.com>
References: <20190320032130.9817-1-colin.xu@intel.com>
 <20190320032130.9817-3-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190320032130.9817-3-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1159782137=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1159782137==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zXfPu6M4uk8xi/G5"
Content-Disposition: inline


--zXfPu6M4uk8xi/G5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.20 11:21:26 +0800, Colin Xu wrote:
> gvt only inits ring regs for existing ring in supported GEN graphics,
> the ring_id could be incontinuous so regs[] could have uninitialized
> value. So limit the ring_id to initilized rings.
> Access to them could cause unexpected behaviours. Although these access
> are protected by current gvt logic and won't hit during running, but still
> has potential security risk in future.
>=20
> intel_context_lookup() could return NULL but is_inhibit_context() will
> access the pointer. Validate intel_context pointer before using.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/mmio_context.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i9=
15/gvt/mmio_context.c
> index 8a2f6e9d2257..01602c2ed85a 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> @@ -162,6 +162,9 @@ static void load_render_mocs(struct drm_i915_private =
*dev_priv)
>  	for (ring_id =3D 0; ring_id < ARRAY_SIZE(regs); ring_id++) {
>  		if (!HAS_ENGINE(dev_priv, ring_id))
>  			continue;
> +		if (ring_id !=3D RCS0 && ring_id !=3D VCS0 && ring_id !=3D VCS1 &&
> +		    ring_id !=3D BCS0 && ring_id !=3D VECS0)
> +			continue;
>  		offset.reg =3D regs[ring_id];

If we won't want to depend on any order of engine id definition, maybe just=
 change
current array index way into a simple switch, and bail out for not valid en=
gine.

>  		for (i =3D 0; i < GEN9_MOCS_SIZE; i++) {
>  			gen9_render_mocs.control_table[ring_id][i] =3D
> @@ -340,8 +343,12 @@ static void handle_tlb_pending_event(struct intel_vg=
pu *vgpu, int ring_id)
>  		[VECS0] =3D 0x4270,
>  	};
> =20
> -	if (WARN_ON(ring_id >=3D ARRAY_SIZE(regs)))
> +	if (ring_id !=3D RCS0 && ring_id !=3D VCS0 && ring_id !=3D VCS1 &&
> +	    ring_id !=3D BCS0 && ring_id !=3D VECS0) {
> +		WARN_ON(1);
> +		gvt_vgpu_err("Invalid ring id (%d)\n", ring_id);
>  		return;
> +	}
> =20
>  	if (!test_and_clear_bit(ring_id, (void *)s->tlb_handle_pending))
>  		return;
> @@ -389,8 +396,13 @@ static void switch_mocs(struct intel_vgpu *pre, stru=
ct intel_vgpu *next,
>  	int i;
> =20
>  	dev_priv =3D pre ? pre->gvt->dev_priv : next->gvt->dev_priv;
> -	if (WARN_ON(ring_id >=3D ARRAY_SIZE(regs)))
> +
> +	if (ring_id !=3D RCS0 && ring_id !=3D VCS0 && ring_id !=3D VCS1 &&
> +	    ring_id !=3D BCS0 && ring_id !=3D VECS0) {
> +		WARN_ON(1);
> +		gvt_err("Invalid ring id (%d)\n", ring_id);
>  		return;
> +	}
> =20
>  	if (ring_id =3D=3D RCS0 &&
>  	    (IS_KABYLAKE(dev_priv) ||
> @@ -458,6 +470,7 @@ static void switch_mmio(struct intel_vgpu *pre,
>  	struct drm_i915_private *dev_priv;
>  	struct intel_vgpu_submission *s;
>  	struct engine_mmio *mmio;
> +	struct intel_context *ce =3D NULL;
>  	u32 old_v, new_v;
> =20
>  	dev_priv =3D pre ? pre->gvt->dev_priv : next->gvt->dev_priv;
> @@ -495,9 +508,8 @@ static void switch_mmio(struct intel_vgpu *pre,
>  			 * image if it's not inhibit context, it will restore
>  			 * itself.
>  			 */
> -			if (mmio->in_context &&
> -			    !is_inhibit_context(intel_context_lookup(s->shadow_ctx,
> -								     dev_priv->engine[ring_id])))
> +			ce =3D intel_context_lookup(s->shadow_ctx, dev_priv->engine[ring_id]);
> +			if (mmio->in_context && ce && !is_inhibit_context(ce))
>  				continue;
> =20
>  			if (mmio->mask)
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

--zXfPu6M4uk8xi/G5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXJR+4wAKCRCxBBozTXgY
Jw90AKCY1GFJbAeK8u91QbP0KU1w8RCb+wCgmGc5f9+XUWsEGkJ7DRC60TFSLa0=
=DBih
-----END PGP SIGNATURE-----

--zXfPu6M4uk8xi/G5--

--===============1159782137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1159782137==--
