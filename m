Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp2016721ywa;
        Mon, 18 Feb 2019 01:18:46 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbAZbVNggO/DQEw9UeGTpohotUT6mJUJN1W+q1iuuE2yp/MhXJjgxlZoOTx4BTS8Q+fidko
X-Received: by 2002:a63:1d1d:: with SMTP id d29mr18094633pgd.49.1550481525902;
        Mon, 18 Feb 2019 01:18:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550481525; cv=none;
        d=google.com; s=arc-20160816;
        b=FGJz1Tj9OPlRt+cna94/58Ieis61MmtMccDHitk2TIBA7gOzAHq7tcsRlE/8lMY8rU
         NprjcP1f+TdjoZnWkSi5K8pDYZXJEu+FlZj8nOfZnxllHpgPCz9+pOg/ANxc1o05FY1b
         wmrA2onFvtTwIoH7xKQJ7ixjDFURj6SX20q3MDk7bKCarG+90ZojsThSCspz4LIYDt7j
         pAFgAFCQFmz5Um3axND1XKQpOSPIaO86xQKMkJFPZpeqP0GtMuTA0k6Nw0Fm0RZtCx1d
         E3GypyCikGXOzWu88/1y+RAFx7Vnks5i8wbwK5+qrSDjG/TaZTZFfzneCZnFjAW39aAg
         NgIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=7XFBKsH6h79+oM7AIb5qGkKfYuQiqzZQlT6vPWBWavA=;
        b=cpNYkOU+m/AeGduEPSpNKGA2N32hrC0cgp/b9V2M9Snly2ZS+XTr4FVlpCwNjB5aAp
         dzuEirNTJKDg20H9xLIKqft+MZ/vWRnlSBiWTPPeHvR38sfQURKbSGNv03kdMwxnQ4VZ
         +7yzjR8zJf2Svj+ix+k8RN35bRslJ5yDWxlKPxXuQ9XgZdBoxSLKvW77/M2s7hGAdcz2
         Gv0dlhUdebT3D2ib2CZkBYvfiHJ3gVefkB9nCn/JmbAeFFH3aeRQBA+AGWRRP2a+6rUN
         t7xEXriYfHXDATJaA114L8/Pp8P1RNoWMwa2wA/QHmelnQuQon5b6KUThb95i69s73yZ
         csPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id y5si12171823pgv.24.2019.02.18.01.18.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 01:18:45 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E72789199;
	Mon, 18 Feb 2019 09:18:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D56E89199
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Feb 2019 09:18:43 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 01:18:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,384,1544515200"; 
 d="asc'?scan'208";a="300561159"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga005.jf.intel.com with ESMTP; 18 Feb 2019 01:18:42 -0800
Date: Mon, 18 Feb 2019 17:09:13 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Use consist max display pipe numbers as
 i915 definition
Message-ID: <20190218090913.GT12380@zhen-hp.sh.intel.com>
References: <20190214045633.15455-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190214045633.15455-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1230590776=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1230590776==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="D5tFrmRBv7YOLFOK"
Content-Disposition: inline


--D5tFrmRBv7YOLFOK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.02.14 12:56:33 +0800, Colin Xu wrote:
> GVT implements a homogeneous vGPU as host GPU so max vGPU display pipes
> can't exceed HW. The inconsistency definition has potential risks which
> could cause array indexing overflow.
>=20
> Remove the unnecessary define of INTEL_GVT_MAX_PIPE and align with i915.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index 8bce09de4b82..ef710e259726 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -111,11 +111,9 @@ struct intel_vgpu_cfg_space {
> =20
>  #define vgpu_cfg_space(vgpu) ((vgpu)->cfg_space.virtual_cfg_space)
> =20
> -#define INTEL_GVT_MAX_PIPE 4
> -
>  struct intel_vgpu_irq {
>  	bool irq_warn_once[INTEL_GVT_EVENT_MAX];
> -	DECLARE_BITMAP(flip_done_event[INTEL_GVT_MAX_PIPE],
> +	DECLARE_BITMAP(flip_done_event[I915_MAX_PIPES],
>  		       INTEL_GVT_EVENT_MAX);
>  };
> =20
> --=20

Looks good to me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--D5tFrmRBv7YOLFOK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXGp2OQAKCRCxBBozTXgY
J2KBAJwJZ/oqt6n+3J6y1xdUs2RABub7IQCfXXe7hMtYcFR/GEqp49a6LGaQtwQ=
=4thk
-----END PGP SIGNATURE-----

--D5tFrmRBv7YOLFOK--

--===============1230590776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1230590776==--
