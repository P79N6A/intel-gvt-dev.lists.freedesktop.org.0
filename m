Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp987005ywb;
        Sun, 10 Mar 2019 20:32:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwDNjG3KXunN9p1MwynXiDYFy4d9k7eiz7Siwy0N0HT6fEdKD7TT6clC427FfsoqDNWl5m9
X-Received: by 2002:a17:902:9a98:: with SMTP id w24mr31235383plp.247.1552275156660;
        Sun, 10 Mar 2019 20:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552275156; cv=none;
        d=google.com; s=arc-20160816;
        b=tTiP9QmxQvvLl1Q2CUoUznMeS4H4lLH8bqbBAld454t4Co6qi4Q7Yt0fq524j7coIt
         1fWvSMc8Gt4/RxPNhL27G0qwSO9J1tFOnTBHJRLsJK85ikFd4+HLspK65DOpShTqEeSq
         rx+ot7lC+kTfOC3IhDaH9HbwvoRMgydZQaZXAUkZuhk2jsDQzrQ39cnl2j0OvOpfqte1
         C6w0V2dy5rUrb9YlpaH16CeJn2uPofs77ZShpe3NvxCttkeKecgfbHmTlc+NcvXZOejL
         ZS/bsV9nFCAgOv9fusMZPKgYB11YDKoMXK4UkmpbBV/YJjt23Bkwuq/DwRNLjEj7kWjT
         TYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=veo9wNaoTO+FVGpAmveveEpcKY3g5ypD1eBOXV8PnxE=;
        b=tVvBLdrD84IW+Mtp2Gdh5R9As1oFaoHvjnkoplqjpAmyhGvItVxMGqySaj16mgZY+5
         O/cr/jB8xbtF8qDdJezwIMicYqwb/ngIxBvgFgbbTQs9nkipZRpYmLlsvpB9TXPCVHHJ
         1Q7XWFVlYTqlD3sQRl/KPyX66aZvwrMLdF7ak5j8DMwFYWKIF+w9THPM9yNP1mp54fmL
         l4h22Nhivow7RgabfZT/nrcBKxlnsCcn+NU3meIA9f41tj6edU1xarwL+4lY7B8JFcY9
         1pwkrvSfQnjZl0Bg+b7W8D4TdWuEITAgNnib1f7sU/zR6sH53fxUZ0Qa5kq8n5M/vi5b
         xGFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 24si4262102pgl.359.2019.03.10.20.32.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Mar 2019 20:32:36 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFE389AFF;
	Mon, 11 Mar 2019 03:32:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5DC89AFF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 11 Mar 2019 03:32:34 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2019 20:32:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,466,1544515200"; 
 d="asc'?scan'208";a="306079685"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga005.jf.intel.com with ESMTP; 10 Mar 2019 20:32:33 -0700
Date: Mon, 11 Mar 2019 11:22:20 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "He, Min" <min.he@intel.com>
Subject: Re: [PATCH v5 1/2] drm/i915/gvt: remove the unused sreg
Message-ID: <20190311032220.GG12380@zhen-hp.sh.intel.com>
References: <20190311014045.13977-1-yan.y.zhao@intel.com>
 <B8F3B07A09E6B84F88EAD83F055E9945519CC56B@SHSMSX103.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <B8F3B07A09E6B84F88EAD83F055E9945519CC56B@SHSMSX103.ccr.corp.intel.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Zhao, Yan Y" <yan.y.zhao@intel.com>
Content-Type: multipart/mixed; boundary="===============0641443265=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0641443265==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DI3e56nQDAJ1LWZd"
Content-Disposition: inline


--DI3e56nQDAJ1LWZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.11 01:49:50 +0000, He, Min wrote:
> Looks good to me. Thanks.
> Reviewed-by: He, Min <min.he@intel.com>
>

Applied this. Thanks!

> > -----Original Message-----
> > From: intel-gvt-dev [mailto:intel-gvt-dev-bounces@lists.freedesktop.org=
] On
> > Behalf Of Yan Zhao
> > Sent: Monday, March 11, 2019 9:41 AM
> > To: intel-gvt-dev@lists.freedesktop.org
> > Cc: Zhao, Yan Y <yan.y.zhao@intel.com>
> > Subject: [PATCH v5 1/2] drm/i915/gvt: remove the unused sreg
> >=20
> > code cleanup. sreg is not used now. remove it for code cleanness.
> >=20
> > v3: remove unnecessary array_size in vreg's memory allocation (min he)
> > v2: do not allocate memory for sreg. (min he)
> >=20
> > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/gvt.h      | 5 -----
> >  drivers/gpu/drm/i915/gvt/handlers.c | 5 +----
> >  drivers/gpu/drm/i915/gvt/mmio.c     | 8 ++------
> >  3 files changed, 3 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/=
gvt.h
> > index ef710e259726..a4fd979b3dad 100644
> > --- a/drivers/gpu/drm/i915/gvt/gvt.h
> > +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> > @@ -94,7 +94,6 @@ struct intel_vgpu_fence {
> >=20
> >  struct intel_vgpu_mmio {
> >  	void *vreg;
> > -	void *sreg;
> >  };
> >=20
> >  #define INTEL_GVT_MAX_BAR_NUM 4
> > @@ -447,10 +446,6 @@ void intel_vgpu_write_fence(struct intel_vgpu
> > *vgpu,
> >  	(*(u64 *)(vgpu->mmio.vreg + i915_mmio_reg_offset(reg)))
> >  #define vgpu_vreg64(vgpu, offset) \
> >  	(*(u64 *)(vgpu->mmio.vreg + (offset)))
> > -#define vgpu_sreg_t(vgpu, reg) \
> > -	(*(u32 *)(vgpu->mmio.sreg + i915_mmio_reg_offset(reg)))
> > -#define vgpu_sreg(vgpu, offset) \
> > -	(*(u32 *)(vgpu->mmio.sreg + (offset)))
> >=20
> >  #define for_each_active_vgpu(gvt, vgpu, id) \
> >  	idr_for_each_entry((&(gvt)->vgpu_idr), (vgpu), (id)) \
> > diff --git a/drivers/gpu/drm/i915/gvt/handlers.c
> > b/drivers/gpu/drm/i915/gvt/handlers.c
> > index b5c0ac04925f..54bd0b033298 100644
> > --- a/drivers/gpu/drm/i915/gvt/handlers.c
> > +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> > @@ -3489,12 +3489,11 @@ int intel_vgpu_mmio_reg_rw(struct intel_vgpu
> > *vgpu, unsigned int offset,
> >  		return mmio_info->read(vgpu, offset, pdata, bytes);
> >  	else {
> >  		u64 ro_mask =3D mmio_info->ro_mask;
> > -		u32 old_vreg =3D 0, old_sreg =3D 0;
> > +		u32 old_vreg =3D 0;
> >  		u64 data =3D 0;
> >=20
> >  		if (intel_gvt_mmio_has_mode_mask(gvt, mmio_info->offset))
> > {
> >  			old_vreg =3D vgpu_vreg(vgpu, offset);
> > -			old_sreg =3D vgpu_sreg(vgpu, offset);
> >  		}
> >=20
> >  		if (likely(!ro_mask))
> > @@ -3516,8 +3515,6 @@ int intel_vgpu_mmio_reg_rw(struct intel_vgpu
> > *vgpu, unsigned int offset,
> >=20
> >  			vgpu_vreg(vgpu, offset) =3D (old_vreg & ~mask)
> >  					| (vgpu_vreg(vgpu, offset) & mask);
> > -			vgpu_sreg(vgpu, offset) =3D (old_sreg & ~mask)
> > -					| (vgpu_sreg(vgpu, offset) & mask);
> >  		}
> >  	}
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/mmio.c
> > b/drivers/gpu/drm/i915/gvt/mmio.c
> > index ed4df2f6d60b..a55178884d67 100644
> > --- a/drivers/gpu/drm/i915/gvt/mmio.c
> > +++ b/drivers/gpu/drm/i915/gvt/mmio.c
> > @@ -239,7 +239,6 @@ void intel_vgpu_reset_mmio(struct intel_vgpu *vgpu,
> > bool dmlr)
> >=20
> >  	if (dmlr) {
> >  		memcpy(vgpu->mmio.vreg, mmio, info->mmio_size);
> > -		memcpy(vgpu->mmio.sreg, mmio, info->mmio_size);
> >=20
> >  		vgpu_vreg_t(vgpu, GEN6_GT_THREAD_STATUS_REG) =3D 0;
> >=20
> > @@ -280,7 +279,6 @@ void intel_vgpu_reset_mmio(struct intel_vgpu *vgpu,
> > bool dmlr)
> >  		 * touched
> >  		 */
> >  		memcpy(vgpu->mmio.vreg, mmio,
> > GVT_GEN8_MMIO_RESET_OFFSET);
> > -		memcpy(vgpu->mmio.sreg, mmio,
> > GVT_GEN8_MMIO_RESET_OFFSET);
> >  	}
> >=20
> >  }
> > @@ -296,12 +294,10 @@ int intel_vgpu_init_mmio(struct intel_vgpu *vgpu)
> >  {
> >  	const struct intel_gvt_device_info *info =3D &vgpu->gvt->device_info;
> >=20
> > -	vgpu->mmio.vreg =3D vzalloc(array_size(info->mmio_size, 2));
> > +	vgpu->mmio.vreg =3D vzalloc(info->mmio_size);
> >  	if (!vgpu->mmio.vreg)
> >  		return -ENOMEM;
> >=20
> > -	vgpu->mmio.sreg =3D vgpu->mmio.vreg + info->mmio_size;
> > -
> >  	intel_vgpu_reset_mmio(vgpu, true);
> >=20
> >  	return 0;
> > @@ -315,5 +311,5 @@ int intel_vgpu_init_mmio(struct intel_vgpu *vgpu)
> >  void intel_vgpu_clean_mmio(struct intel_vgpu *vgpu)
> >  {
> >  	vfree(vgpu->mmio.vreg);
> > -	vgpu->mmio.vreg =3D vgpu->mmio.sreg =3D NULL;
> > +	vgpu->mmio.vreg =3D NULL;
> >  }
> > --
> > 2.17.1
> >=20
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--DI3e56nQDAJ1LWZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXIXUbAAKCRCxBBozTXgY
J3GLAJ48j291N575Jh3nLXQ23X7TrqtjYACbBRgotWL6fkyZttRH6aLuXyn3YW8=
=QpiJ
-----END PGP SIGNATURE-----

--DI3e56nQDAJ1LWZd--

--===============0641443265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0641443265==--
