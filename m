Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp120429ywe;
        Thu, 28 Feb 2019 18:49:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqy00z4DHHZaTRLBpqy1LTmjqUU+JR17rkHyQek9YJo+d9o/VPiNCPdNToWOF+QiEkikUOuk
X-Received: by 2002:a65:6105:: with SMTP id z5mr2553155pgu.434.1551408578067;
        Thu, 28 Feb 2019 18:49:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551408578; cv=none;
        d=google.com; s=arc-20160816;
        b=sXOTRwLLyDPqbdRHSoZJKcDh5nPNu44I6N8V+pt3togOLfYMpubQn4AX221VCmYkkd
         ruLtW1hNgurHNA4475mudETLfL4tbPvHnf9TcNuL8lRQeg3te4BiV6Y2TbRFbXoTby3T
         r18pEYlSIbfDwbXfMb/DmkhjoKRLA3fCJnV3edoPnmwSQVeoKF5GK+AFkUK3DP+rtiP5
         Rcj0ClyhcgbuTSatIVSpnaZu9Bnrig1ecuw+HR1W0S7ke/FMwh2YPrWC9TdBY69W9M1R
         CnvHb4OZ4ZLfGiOCMhZ9hO0Pk5KXy+dS/wCqsBvOp1XnoDhMwbgBcGNjFgABj1gtFfXi
         WXQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=PB0UOOlDx0f3TJ3/hWvV6Eb4uQvKEWs/pINQVpyqGkI=;
        b=NCUDmG4fdrvIpBtQMph0XYlMWJ7sVtLuj3KZQ4mwazTPMspoWUEbp5EHHUO6rtVRue
         mf2C3cK0YbfZ2UbNUsDVWfUpXoiI68uyIIo+d1N73oFCvl3uFOmSLzHf/DxmgGGSo/D3
         voQU0IIpClfZ+oHZshse1rt9qEj4FUElLM7rV6sCqjrLABnr6/TaMKHb21RanRkKo2jD
         1p9YEyhPDO3m90PXmkAjhmpgcYYARnzLCBd4qCsmYxrEbxuJVcGMWOVfyPIThKmQXRON
         EF5jbWF+aI9X0XwiiZfKZJxwsx368qEPXB8tAHDOHnLtuldfj97WxPM+uecHreDD5jlE
         dP7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id y17si21245701pfb.204.2019.02.28.18.49.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 18:49:38 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519326E24F;
	Fri,  1 Mar 2019 02:49:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D096E24F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  1 Mar 2019 02:49:35 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2019 18:49:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,425,1544515200"; 
 d="asc'?scan'208";a="143642734"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga001.jf.intel.com with ESMTP; 28 Feb 2019 18:49:33 -0800
Date: Fri, 1 Mar 2019 10:39:42 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Zhang, Xiong Y" <xiong.y.zhang@intel.com>
Subject: Re: [PATCH 1/3] drm/i915/gvt: Don't submit request for error
 workload dispatch
Message-ID: <20190301023942.GD12380@zhen-hp.sh.intel.com>
References: <20190228095542.23356-1-zhenyuw@linux.intel.com>
 <8082FF9BCB2B054996454E47167FF4EC27543BCE@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <8082FF9BCB2B054996454E47167FF4EC27543BCE@SHSMSX104.ccr.corp.intel.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1213010439=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1213010439==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w0wZBAr4bXcLEtGS"
Content-Disposition: inline


--w0wZBAr4bXcLEtGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.01 02:10:40 +0000, Zhang, Xiong Y wrote:
>=20
> > As vGPU shadow ctx is loaded with guest context state, arbitrarily subm=
itting
> > request in error workload dispatch path would cause trouble.
> > So don't try to submit in error path now like in previous code.
> > This is to fix VM failure when GPU hang happens.
> [Zhang, Xiong Y] As in the previous comments, arbitrarily submitting
> request in error workload dispatch path would cause gpu hang. But what's =
the mean of "This is to fix VM failure when GPU hang happens" ?

This error path was triggered when GPU hang happens that looks cause unreco=
very
hang that all VM failed then. Thanks for review!

>=20
> Reviewed-by: Xiong Zhang (xiong.y.zhang@intel.com)
>=20
> thanks
> >=20
> > Fixes: f0e994372518 ("drm/i915/gvt: Fix workload request allocation bef=
ore
> > request add")
> > Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/scheduler.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c
> > b/drivers/gpu/drm/i915/gvt/scheduler.c
> > index 1bb8f936fdaa..5b59cba9f93a 100644
> > --- a/drivers/gpu/drm/i915/gvt/scheduler.c
> > +++ b/drivers/gpu/drm/i915/gvt/scheduler.c
> > @@ -678,6 +678,7 @@ static int dispatch_workload(struct
> > intel_vgpu_workload *workload)  {
> >  	struct intel_vgpu *vgpu =3D workload->vgpu;
> >  	struct drm_i915_private *dev_priv =3D vgpu->gvt->dev_priv;
> > +	struct i915_request *rq;
> >  	int ring_id =3D workload->ring_id;
> >  	int ret;
> >=20
> > @@ -703,6 +704,13 @@ static int dispatch_workload(struct
> > intel_vgpu_workload *workload)
> >=20
> >  	ret =3D prepare_workload(workload);
> >  out:
> > +	if (ret) {
> > +		/* We might still need to add request with
> > +		 * clean ctx to retire it properly.. */
> > +		rq =3D fetch_and_zero(&workload->req);
> > +		i915_request_put(rq);
> > +	}
> > +
> >  	if (!IS_ERR_OR_NULL(workload->req)) {
> >  		gvt_dbg_sched("ring id %d submit workload to i915 %p\n",
> >  				ring_id, workload->req);
> > --
> > 2.20.1
> >=20
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--w0wZBAr4bXcLEtGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXHibbgAKCRCxBBozTXgY
J9edAKCXdfYtw7qJ9roVtW5tVhPKaz8FhQCgipr8B+D5V1rLe2FRjtJIW6tMkJQ=
=UHFN
-----END PGP SIGNATURE-----

--w0wZBAr4bXcLEtGS--

--===============1213010439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1213010439==--
