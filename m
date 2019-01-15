Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp4022897ywd;
        Tue, 15 Jan 2019 02:29:30 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5PE3Y651MeBOqFCQpUkg3LxfLtvGYvOjv71gkwQ+beFKRAB55Jl7WBBsxmZpHVMQmZkrUW
X-Received: by 2002:a17:902:43e4:: with SMTP id j91mr3294744pld.147.1547548170224;
        Tue, 15 Jan 2019 02:29:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547548170; cv=none;
        d=google.com; s=arc-20160816;
        b=gq3cUrqIg7GIshEy5TNR+VpyxDmmrMzFObtBvKDgRoLhp7mzCT1hUpOjoYm5NH3AjV
         MHnsfmY+L4AJ2BRxtCtQjTIk+pGOUJ8E/MgcqRRuefRnax+KqI7NIWJ8wNyAPB0sR6EM
         7Qm6ieZ2ub9FQvsHykm/717lKObyvPaerppHAtvJxIkIDU1uWSo2yzegh1W4EsVjmgO2
         qePx/3I3tyclrhNe2nD1lc6nCQE8344D+x9FAG15wlQ8W8RzNQ538VbIyIGuXS8HnhK5
         PFldgsac86cJazOHdsEUC/w7ug7ZNu1fvo3Yf578ZNpjdp4q2NmZs/xtMZFsQ9g4R18Y
         ljRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=N8pE3BT7vX/bvvDSdyeRHDnSLYTJeXg5T3sVvvIyvmY=;
        b=0mlF2Ykvw05KdT0vC7NS6Yj+ggADlXVtzRK4lrULV2x5ZnwiX2TeSBrCKlSCFfbaap
         tiB+2MLGLBI5bq0ovag/FSW8Niekh2y7TsLbu6l2C+fUI9P1wV9tFFL8+E7f1EwUJM49
         xbLfDlyMY4ltNXbKWCVIj+3pOCVKuSxZEcHKyCgukEKaV61tDrcdkQvjRZf6n6Tw9SZG
         uT3U8pikFKEYXy/Adihik8H2bdKD0qhLiCfN1aAiACnaHPuddrlWVq1VTEq4DvtQ4e43
         W0EzIwC4dsDdYg4j/qgcYWkotoaM2jihEZMhdJ7b28ORH5S6nU82BR+YrpWOb1XDb/t+
         NQrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id d14si2913394pgi.158.2019.01.15.02.29.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jan 2019 02:29:30 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FC76EC5C;
	Tue, 15 Jan 2019 10:29:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F4B6EC5C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 15 Jan 2019 10:29:28 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2019 02:29:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,481,1539673200"; 
 d="asc'?scan'208";a="267252191"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.8])
 by orsmga004.jf.intel.com with ESMTP; 15 Jan 2019 02:29:27 -0800
Date: Tue, 15 Jan 2019 18:18:02 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Allow F_CMD_ACCESS on mmio 0x21f0
Message-ID: <20190115101802.GH11631@zhen-hp.sh.intel.com>
References: <20190111062554.16409-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190111062554.16409-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============2088746884=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2088746884==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E0IhBwMLbrMClE+H"
Content-Disposition: inline


--E0IhBwMLbrMClE+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.01.11 14:25:54 +0800, Colin Xu wrote:
> The newly updated guest driver could program 0x21f0 via lri and srm,
> without F_CMD_ACCESS flag cmd parser will stop parser reset cmd.
> 0x21f0 applies to BDW, SKL, KBL, BXT and CFL.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---

Applied, thanks!

>  drivers/gpu/drm/i915/gvt/handlers.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 68a62ba5bf54..a4b9659017fd 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -2799,6 +2799,7 @@ static int init_broadwell_mmio_info(struct intel_gv=
t *gvt)
>  	MMIO_DFH(_MMIO(0xe2a0), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>  	MMIO_DFH(_MMIO(0xe2b0), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>  	MMIO_DFH(_MMIO(0xe2c0), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
> +	MMIO_DFH(_MMIO(0x21f0), D_BDW_PLUS, F_CMD_ACCESS, NULL, NULL);
>  	return 0;
>  }
> =20
> --=20
> 2.20.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--E0IhBwMLbrMClE+H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXD2zWgAKCRCxBBozTXgY
J1hrAKCQfzf4KDVhTsOQbLgclHhRQX/M4ACdFeDqdPrwCtPj1whFt8wiT/IjvXA=
=Q9Ux
-----END PGP SIGNATURE-----

--E0IhBwMLbrMClE+H--

--===============2088746884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============2088746884==--
