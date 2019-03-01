Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp149714ywe;
        Thu, 28 Feb 2019 19:32:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqwcC2ZDCa79xCnQH0m1WhWfIHtSsmx+0p6FTAsoSpXbnW0Q2tchnfy75veeWDvtkZ7FWE3Z
X-Received: by 2002:a17:902:20e2:: with SMTP id v31mr3139254plg.307.1551411159354;
        Thu, 28 Feb 2019 19:32:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551411159; cv=none;
        d=google.com; s=arc-20160816;
        b=n2T8R6XxTDmtTfuJ1d5Roquoc2O8ZL+0L2rgdsPzlRxbJeTyoeU8Pb/oISJQS0mNzE
         6EgukdCfysoZtZHVfju6Qo5A+u8uAAPJ/vp/EAm80bVG6mFCfZBSOihJr7pPQSTqhUWK
         AVD8KUtoPwBLyXb3UJ6c4m8BO8zhL7e7KEVCc55iYBLsXa1Yr6V4Wmyvb0k+WCj8PJ5S
         M4BOJ2WofbQCGBKdr//frrNhQMLIt3QzKCSBi6/jKPToC96PCsQ3Wnn8wQ4qCiCD6szg
         w/vUoE4PAXi06a0Dlv8DDlRxG2+PBll9fku7DQgvFjP/Al5aaaz5CQCEsiLOKw/GS4i3
         BJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=6Dp/V5auAQBf5Ls9b1d3L7PtfWZD3aioIO/Id89SAaM=;
        b=tl5XPg/lbzRElsC9/OaOW1mH+pkpqQrtoFPZnXg9CAlW/xXkOkTsi0POY/7nPzQcwf
         fEdqbvefMN6L6/qcSS2nWkil72Xpl1I7sBt5XNHbf7i+pEvj6sm7K2gh4sBeQmsz+hEK
         VILao2K77BYwiHjU6trmtXw//NAidGzqxbV/QYrbkjDFPd8gujZC2Q3MlMZGMAV0gM1N
         VbyRNvDfUCuGlAhjp3UP6cNrB8YsxUghtFirp+kUFeTsFT2xC5YgORDogSTFk7NSwHbr
         UYQpOLeXFoJ/NCHj+BxXDBgxlIZr+e6IIJ9PpeClusB3wExqHXyOV9+rnlQf5DEacdLK
         SWvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id b5si18135982pgw.377.2019.02.28.19.32.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 19:32:39 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6836E250;
	Fri,  1 Mar 2019 03:32:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DEE6E250
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  1 Mar 2019 03:32:37 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2019 19:32:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,425,1544515200"; 
 d="asc'?scan'208";a="147537110"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2019 19:32:35 -0800
Date: Fri, 1 Mar 2019 11:22:44 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
Subject: Re: [PATCH 2/3] drm/i915/gvt: Only assign ppgtt root at dispatch time
Message-ID: <20190301032244.GF12380@zhen-hp.sh.intel.com>
References: <20190228095542.23356-1-zhenyuw@linux.intel.com>
 <20190228095542.23356-2-zhenyuw@linux.intel.com>
 <8082FF9BCB2B054996454E47167FF4EC27543C82@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <8082FF9BCB2B054996454E47167FF4EC27543C82@SHSMSX104.ccr.corp.intel.com>
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
 <intel-gvt-dev@lists.freedesktop.org>, Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: multipart/mixed; boundary="===============1224384814=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1224384814==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CLy2MrvMHpW9mjhY"
Content-Disposition: inline


--CLy2MrvMHpW9mjhY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.01 02:56:45 +0000, Zhang, Xiong Y wrote:
> > This moves ppgtt root hook out of scan and shadow function, as it's only
> > required at dispatch time. Also make sure this checks against shadow mm=
 to
> > be ready, otherwise bail earlier.
> [Zhang, Xiong Y] Don't see the benefit for this.

Current symptom is that when some hang happens, set_context_ppgtt_from_shad=
ow()
always failed, but still need to find out that reason, as its function is n=
ot
related to scan and shadow, we did have place to call early scan, so moving=
 this
only for dispatch time.

> I indeed found a potential issue in our code: intel_vgpu_create_workload(=
) call intel_gvt_scan_and_shadow_workload() which operate shadow_ctx, but s=
hadow_ctx may be used by other engine at this time, this will cause other e=
ngine trouble. I see before calling scan_and_shadow, it call mutex_lock(drm=
=2Estruct_mutex), I don't think this could prevent the issue.
>

yeah, I think that's valid concern, currently we have a window between work=
load dispatch
and complete, which workload thread won't hold vgpu lock to guard against a=
nother new
submission from guest, so potentially new dispatch could happen during that=
 on another
engine's thread. So looks at least we need to have shadow ctx for each engi=
ne.

> thanks
> >=20
> > Cc: Xiong Zhang <xiong.y.zhang@intel.com>
> > Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/scheduler.c | 16 +++++++++-------
> >  1 file changed, 9 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c
> > b/drivers/gpu/drm/i915/gvt/scheduler.c
> > index 5b59cba9f93a..e28a3b3513a4 100644
> > --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> > +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> > @@ -346,7 +346,7 @@ static int set_context_ppgtt_from_shadow(struct
> > intel_vgpu_workload *workload,
> >  	int i =3D 0;
> >=20
> >  	if (mm->type !=3D INTEL_GVT_MM_PPGTT
> > || !mm->ppgtt_mm.shadowed)
> > -		return -1;
> > +		return -EINVAL;
> >=20
> >  	if (mm->ppgtt_mm.root_entry_type =3D=3D
> > GTT_TYPE_PPGTT_ROOT_L4_ENTRY) {
> >  		px_dma(&ppgtt->pml4) =3D mm->ppgtt_mm.shadow_pdps[0]; @@
> > -410,12 +410,6 @@ int intel_gvt_scan_and_shadow_workload(struct
> > intel_vgpu_workload *workload)
> >  	if (workload->shadow)
> >  		return 0;
> >=20
> > -	ret =3D set_context_ppgtt_from_shadow(workload, shadow_ctx);
> > -	if (ret < 0) {
> > -		gvt_vgpu_err("workload shadow ppgtt isn't ready\n");
> > -		return ret;
> > -	}
> > -
> >  	/* pin shadow context by gvt even the shadow context will be pinned
> >  	 * when i915 alloc request. That is because gvt will update the guest
> >  	 * context from shadow context when workload is completed, and at
> > that @@ -678,6 +672,8 @@ static int dispatch_workload(struct
> > intel_vgpu_workload *workload)  {
> >  	struct intel_vgpu *vgpu =3D workload->vgpu;
> >  	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> > +	struct intel_vgpu_submission *s =3D &vgpu->submission;
> > +	struct i915_gem_context *shadow_ctx =3D s->shadow_ctx;
> >  	struct i915_request *rq;
> >  	int ring_id =3D workload->ring_id;
> >  	int ret;
> > @@ -688,6 +684,12 @@ static int dispatch_workload(struct
> > intel_vgpu_workload *workload)
> >  	mutex_lock(&vgpu->vgpu_lock);
> >  	mutex_lock(&dev_priv->drm.struct_mutex);
> >=20
> > +	ret =3D set_context_ppgtt_from_shadow(workload, shadow_ctx);
> > +	if (ret < 0) {
> > +		gvt_vgpu_err("workload shadow ppgtt isn't ready\n");
> > +		goto err_req;
> > +	}
> > +
> >  	ret =3D intel_gvt_workload_req_alloc(workload);
> >  	if (ret)
> >  		goto err_req;
> > --
> > 2.20.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--CLy2MrvMHpW9mjhY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXHilgwAKCRCxBBozTXgY
J6ukAJ9mJxqgZao7LtkF8Fljzmw8xNwW/gCfQ49PVH9c0fJ6YtWQW9MK9KQOeJc=
=wn9O
-----END PGP SIGNATURE-----

--CLy2MrvMHpW9mjhY--

--===============1224384814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1224384814==--
