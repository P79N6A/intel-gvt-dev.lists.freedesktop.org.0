Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2488025ywo;
        Wed, 3 Apr 2019 01:34:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLo9eV4ykGfMBfadNeRl0DntTrcZnJ60340ROAxnW9JXoIoV5IaG1qyq2xZwVQJgZui7jP
X-Received: by 2002:a17:902:6949:: with SMTP id k9mr11797314plt.59.1554280479191;
        Wed, 03 Apr 2019 01:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554280479; cv=none;
        d=google.com; s=arc-20160816;
        b=uOBOO0M6r+/zmwJYtxxp3nStyi4HuICpUHfvfx0qQtcKC1zSzBeX0tdyrEDg1zBziu
         Dd4iu2n/DuFQUhNP0rdOpeRrE72ojgJE/TWErMC2X2mPyeNN4PHQJQ2fROv9p0UIjJ6Y
         CxV/fVRY0q8b4LWaaomL/0j9UATehp3gv60rZEm70idJs69MpigOKGF/oHxCaHVNGJm7
         vj2Ngi/5otfyQcYj5ESNdlIBKqBGybX/MJWrKz5ZtHPqomIN9Lp5HgeXtQT1x4yjeCOb
         u/o9wY4XcYT8eWSrjkUakNCLE6WeWxELTvkuca1r9PNL8bchtZJdfa4KMYW9lkKrL36v
         qy5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=erB1NWUOKiiJbB48ZL/HbCnYTZL5Z39QVEFEA2rfBrw=;
        b=WjdRQE+oZO51QoQjKCXhHnybrtvTFubrGa/JqaeL8QEsZQxOAWaQDOnMo1Ue03sa2f
         hs6GgC1V3GRBrsShBTgNh5eSThDPAMBFWexTPucXDsJYZPrAJrIGuLWX9TUkI3mvYhV5
         /1FImBo0rhwDeW6fYsaXqjJgUAe2FqbNZakSbBryMsfBAS374W7zUL6EezJ7EgWsWyKb
         nnCc+xbAc6b0jTUSQeVB5N/RQsdXbm/N3Ew8tHwi6D8zt53fk8yYP++YFO0bJgvD+skI
         vm4isHm6Z3zisE8gm8VhGAIx81Sua33qbb2viZ2RofjP2C3705giqLudm9aifjEJPbWi
         fXQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id h7si6984370pgj.363.2019.04.03.01.34.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 01:34:39 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F7A89105;
	Wed,  3 Apr 2019 08:34:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19DB89109
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2019 08:34:37 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Apr 2019 01:34:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,304,1549958400"; 
 d="asc'?scan'208";a="157783663"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2019 01:34:36 -0700
Date: Wed, 3 Apr 2019 16:23:33 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: Fix incorrect mask of mmio 0x22028 in
 gen8/9 mmio list
Message-ID: <20190403082333.GL2322@zhen-hp.sh.intel.com>
References: <20190401061353.17886-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190401061353.17886-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0582461015=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0582461015==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLauP2uySp+9cKYP"
Content-Disposition: inline


--SLauP2uySp+9cKYP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.01 14:13:53 +0800, Colin Xu wrote:
> According to GFX PRM on 01.org, bit 31:16 of mmio 0x22028 should be masks.
>=20
> Fixes: 178657139307 ("drm/i915/gvt: vGPU context switch")
>=20
> v2:
> Rebase to latest gvt-staging.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/mmio_context.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i9=
15/gvt/mmio_context.c
> index 76630fbe51b6..e7e14c842be4 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> @@ -68,7 +68,7 @@ static struct engine_mmio gen8_engine_mmio_list[] __cac=
heline_aligned =3D {
>  	{BCS0, RING_MI_MODE(BLT_RING_BASE), 0xffff, false}, /* 0x2209c */
>  	{BCS0, RING_INSTPM(BLT_RING_BASE), 0xffff, false}, /* 0x220c0 */
>  	{BCS0, RING_HWSTAM(BLT_RING_BASE), 0x0, false}, /* 0x22098 */
> -	{BCS0, RING_EXCC(BLT_RING_BASE), 0x0, false}, /* 0x22028 */
> +	{BCS0, RING_EXCC(BLT_RING_BASE), 0xffff, false}, /* 0x22028 */
>  	{RCS0, INVALID_MMIO_REG, 0, false } /* Terminated */
>  };
> =20
> @@ -119,7 +119,7 @@ static struct engine_mmio gen9_engine_mmio_list[] __c=
acheline_aligned =3D {
>  	{BCS0, RING_MI_MODE(BLT_RING_BASE), 0xffff, false}, /* 0x2209c */
>  	{BCS0, RING_INSTPM(BLT_RING_BASE), 0xffff, false}, /* 0x220c0 */
>  	{BCS0, RING_HWSTAM(BLT_RING_BASE), 0x0, false}, /* 0x22098 */
> -	{BCS0, RING_EXCC(BLT_RING_BASE), 0x0, false}, /* 0x22028 */
> +	{BCS0, RING_EXCC(BLT_RING_BASE), 0xffff, false}, /* 0x22028 */
> =20
>  	{VCS1, RING_EXCC(GEN8_BSD2_RING_BASE), 0xffff, false}, /* 0x1c028 */
> =20
> --=20

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--SLauP2uySp+9cKYP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXKRthQAKCRCxBBozTXgY
JyNOAJ9eGv/JhqiWNww1lVlr1cpJxClHFgCeJfYL00FOP5SvoVmoWo7DOuHmQ9E=
=8TVo
-----END PGP SIGNATURE-----

--SLauP2uySp+9cKYP--

--===============0582461015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0582461015==--
