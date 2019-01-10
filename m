Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1318343ywd;
        Wed, 9 Jan 2019 19:12:20 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4aqa1e++IB/UliWwt9jJ7KFBeaoll5PxpoM8ywMU7+nMgUKfTRWkHcnxCEqh/mblXy+fln
X-Received: by 2002:a63:85c6:: with SMTP id u189mr5448642pgd.156.1547089939947;
        Wed, 09 Jan 2019 19:12:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547089939; cv=none;
        d=google.com; s=arc-20160816;
        b=Lt1SSumr0vRr+2UR8JS7OWx1My4vNLAC8kbLA45PzfcyFqmAuz3GDbmrFCQRNY2cFL
         WyVW5FYx6ubkRPoUayRfz9l99vwl2HBWNOSUrFtoNIDCg529E5EXijGsKhq1MgzJWTWF
         TxKja77Dcbb0IoCc43EbwIAt+/ZwE+FLdFcIJ3UTql1vU+l50eP1agCRo2tQJ6Ddaenj
         vZvMeBDXR0K3l48JU4t1CoTTI2SkZFYMzRSa/Pi/XXpeySdPKvHZou3zjEhrecJqV2ag
         Use4ZNcLWNsTiC+t5qkLVhGlbjkl5811n5CWrHJ37yTy2RypSJ9A0Et6xhbpZghhMWSr
         hcag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=j/+lZN2+B7GL684Ygj8eEN0wMRznueL4Mjjj083joTI=;
        b=wez8r7AWZEyq2HiQ3YZp9W03YsLYiPhSr9jTR5cbcCoufg3sNS8MK/QyWFjLcZXyoE
         vV6iXcP0q3lZit79e2jgI8bPdkDVzEbFuOpfOCUOBIId7+ELB8YDtBA66B/ffCFXA5vM
         M7RgEtdcK5clYioBo4ZPYb8YNbdWPezGx54cHJ+KDupRH7qI+iZorqZ5AGpPa90CrlCV
         6t536Q56Grfhkmdokz7kVzk/Q1gRo8wZNfvTJbKi7qf976UFJhuA0A/GY2QXplwxKFAt
         XouTtjKnGVhyZojkmCcjv54B1pV3yadjBCh/p3bpu+kqGZQwwuOkgRDh5blm4EC2hx4z
         UcDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id f23si48430967pgv.431.2019.01.09.19.12.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jan 2019 19:12:19 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C53A6E639;
	Thu, 10 Jan 2019 03:12:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0496E639;
 Thu, 10 Jan 2019 03:12:18 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2019 19:12:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,459,1539673200"; 
 d="asc'?scan'208";a="113556493"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.8])
 by fmsmga007.fm.intel.com with ESMTP; 09 Jan 2019 19:12:17 -0800
Date: Thu, 10 Jan 2019 11:01:03 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: remove drmP.h include
Message-ID: <20190110030103.GO11631@zhen-hp.sh.intel.com>
References: <20190108082545.25808-1-jani.nikula@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190108082545.25808-1-jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 zhenyuw@linux.intel.com, zhi.a.wang@intel.com
Content-Type: multipart/mixed; boundary="===============1768318056=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1768318056==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fmvA4kSBHQVZhkR6"
Content-Disposition: inline


--fmvA4kSBHQVZhkR6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.01.08 10:25:45 +0200, Jani Nikula wrote:
> drmP.h is deprecated and no longer needed.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt=
/dmabuf.c
> index 51ed99a37803..2eb681175fae 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -29,7 +29,6 @@
>   */
> =20
>  #include <linux/dma-buf.h>
> -#include <drm/drmP.h>
>  #include <linux/vfio.h>
> =20
>  #include "i915_drv.h"
> --=20

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

Thanks! Will apply later.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--fmvA4kSBHQVZhkR6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXDa1bwAKCRCxBBozTXgY
J7nLAKCMl2DVuy8/pSZd2jO1s+3KUMfn/ACePrzh1cY22aMsBcKznN0pD6dfdJc=
=VvAk
-----END PGP SIGNATURE-----

--fmvA4kSBHQVZhkR6--

--===============1768318056==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============1768318056==--
