Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp1333270ywb;
        Thu, 28 Mar 2019 19:51:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEitqv5uB8AFT3Ggr/2RBQc8RMpMVHIXi+HNZ/79Fy0vF8Ah8vpQcq6LcufyhA+DYLBFYy
X-Received: by 2002:a62:cd8c:: with SMTP id o134mr43999591pfg.84.1553827917649;
        Thu, 28 Mar 2019 19:51:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553827917; cv=none;
        d=google.com; s=arc-20160816;
        b=Gp5PektGycwa51yOjnsZHJHsJRp7e8znN2FIG4yxCQcjo1bwidDI1qNwjIFpNng76w
         swHuQys5kN9dU4sLZeV/E8c6Er54IfE5MpBnaPttUavGRxoCMmGMLFlw4aEoY5dxkAFV
         trRFDVEUDUTUoIYZH3u4RSU3FDBtRd1VrkR5vHbFxkZwaYWLPBRzwA9NWBMbpE8Zs2iF
         DSQf5pqa2xW6641M89F0h59PEGfAD9TigFCmAICli1En3ymMTvKY/+uKhFgrLbdD3/yM
         kdFanlxqAgLE2yQY2JvKP1zt9tz4q6Zv+Hc7uuyW9Er7/gZDU4zydTWF88296S7Y43xF
         9Wjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=zoZ7lwBM0DtczoBaQsjsnk2kNLfYrkmWZ4n+/r6ER/w=;
        b=dZdb1uZwtwuL/+YOeZ1euWdcd4v/A1oPYunO3lnKDsxUgV24TUs4lgTdlKCKuxZABv
         3pHENUJNUEmZduduQM+SNDBNOG86sTtGu+FXrBhpQEX4wG9laHZIKAFLeco28Q3SPDju
         US376o/6aakMorFt7/xFOOq2FlPQ1YeHWwiAmjLvXU2moUqJjXEdveS8wvTOQc4xkB3q
         ZycpbTKtwMpwEYAzyNtLcbCE5orz7nq1QEXD+5uzXT67kjxEubFNIK/xVV7BGIauy4TD
         3y1d7mjog/Dj1Z1iSO369Bf5qR9K6gBG+jHTzLPfIOeOEcyRhD1SE5iiw9Pu8pQtC6VV
         6VCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id u37si797910pga.301.2019.03.28.19.51.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 19:51:57 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FEE6E80E;
	Fri, 29 Mar 2019 02:51:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2447C6E80E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 29 Mar 2019 02:51:55 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Mar 2019 19:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; 
 d="asc'?scan'208";a="129638062"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga008.jf.intel.com with ESMTP; 28 Mar 2019 19:51:53 -0700
Date: Fri, 29 Mar 2019 10:41:01 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: replaced register address with name
Message-ID: <20190329024101.GS10798@zhen-hp.sh.intel.com>
References: <1553102043-29206-1-git-send-email-xiaolin.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1553102043-29206-1-git-send-email-xiaolin.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0098683847=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0098683847==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GUfsrdPq8omuo5Le"
Content-Disposition: inline


--GUfsrdPq8omuo5Le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.20 13:14:03 -0400, Xiaolin Zhang wrote:
> in init_skil_mmio_info, replaced register address with the known
> name from i915_reg.h definition to improve code readbility.
>=20
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> ---

Thanks, it's always good to use defined name instead of open code.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/handlers.c | 79 +++++++++++++++++++------------=
------
>  1 file changed, 40 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index 63418c8..02e7420 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -2827,26 +2827,26 @@ static int init_skl_mmio_info(struct intel_gvt *g=
vt)
> =20
>  	MMIO_DH(DBUF_CTL, D_SKL_PLUS, NULL, gen9_dbuf_ctl_mmio_write);
> =20
> -	MMIO_D(_MMIO(0xa210), D_SKL_PLUS);
> +	MMIO_D(GEN9_PG_ENABLE, D_SKL_PLUS);
>  	MMIO_D(GEN9_MEDIA_PG_IDLE_HYSTERESIS, D_SKL_PLUS);
>  	MMIO_D(GEN9_RENDER_PG_IDLE_HYSTERESIS, D_SKL_PLUS);
>  	MMIO_DFH(GEN9_GAMT_ECO_REG_RW_IA, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> -	MMIO_DH(_MMIO(0x4ddc), D_SKL_PLUS, NULL, NULL);
> -	MMIO_DH(_MMIO(0x42080), D_SKL_PLUS, NULL, NULL);
> -	MMIO_D(_MMIO(0x45504), D_SKL_PLUS);
> -	MMIO_D(_MMIO(0x45520), D_SKL_PLUS);
> -	MMIO_D(_MMIO(0x46000), D_SKL_PLUS);
> -	MMIO_DH(_MMIO(0x46010), D_SKL_PLUS, NULL, skl_lcpll_write);
> -	MMIO_DH(_MMIO(0x46014), D_SKL_PLUS, NULL, skl_lcpll_write);
> -	MMIO_D(_MMIO(0x6C040), D_SKL_PLUS);
> -	MMIO_D(_MMIO(0x6C048), D_SKL_PLUS);
> -	MMIO_D(_MMIO(0x6C050), D_SKL_PLUS);
> -	MMIO_D(_MMIO(0x6C044), D_SKL_PLUS);
> -	MMIO_D(_MMIO(0x6C04C), D_SKL_PLUS);
> -	MMIO_D(_MMIO(0x6C054), D_SKL_PLUS);
> -	MMIO_D(_MMIO(0x6c058), D_SKL_PLUS);
> -	MMIO_D(_MMIO(0x6c05c), D_SKL_PLUS);
> -	MMIO_DH(_MMIO(0x6c060), D_SKL_PLUS, dpll_status_read, NULL);
> +	MMIO_DH(MMCD_MISC_CTRL, D_SKL_PLUS, NULL, NULL);
> +	MMIO_DH(CHICKEN_PAR1_1, D_SKL_PLUS, NULL, NULL);
> +	MMIO_D(DC_STATE_EN, D_SKL_PLUS);
> +	MMIO_D(DC_STATE_DEBUG, D_SKL_PLUS);
> +	MMIO_D(CDCLK_CTL, D_SKL_PLUS);
> +	MMIO_DH(LCPLL1_CTL, D_SKL_PLUS, NULL, skl_lcpll_write);
> +	MMIO_DH(LCPLL2_CTL, D_SKL_PLUS, NULL, skl_lcpll_write);
> +	MMIO_D(_MMIO(_DPLL1_CFGCR1), D_SKL_PLUS);
> +	MMIO_D(_MMIO(_DPLL2_CFGCR1), D_SKL_PLUS);
> +	MMIO_D(_MMIO(_DPLL3_CFGCR1), D_SKL_PLUS);
> +	MMIO_D(_MMIO(_DPLL1_CFGCR2), D_SKL_PLUS);
> +	MMIO_D(_MMIO(_DPLL2_CFGCR2), D_SKL_PLUS);
> +	MMIO_D(_MMIO(_DPLL3_CFGCR2), D_SKL_PLUS);
> +	MMIO_D(DPLL_CTRL1, D_SKL_PLUS);
> +	MMIO_D(DPLL_CTRL2, D_SKL_PLUS);
> +	MMIO_DH(DPLL_STATUS, D_SKL_PLUS, dpll_status_read, NULL);
> =20
>  	MMIO_DH(SKL_PS_WIN_POS(PIPE_A, 0), D_SKL_PLUS, NULL, pf_write);
>  	MMIO_DH(SKL_PS_WIN_POS(PIPE_A, 1), D_SKL_PLUS, NULL, pf_write);
> @@ -2965,40 +2965,41 @@ static int init_skl_mmio_info(struct intel_gvt *g=
vt)
>  	MMIO_DH(_MMIO(_REG_701C4(PIPE_C, 3)), D_SKL_PLUS, NULL, NULL);
>  	MMIO_DH(_MMIO(_REG_701C4(PIPE_C, 4)), D_SKL_PLUS, NULL, NULL);
> =20
> -	MMIO_D(_MMIO(0x70380), D_SKL_PLUS);
> -	MMIO_D(_MMIO(0x71380), D_SKL_PLUS);
> +	MMIO_D(_MMIO(_PLANE_CTL_3_A), D_SKL_PLUS);
> +	MMIO_D(_MMIO(_PLANE_CTL_3_B), D_SKL_PLUS);
>  	MMIO_D(_MMIO(0x72380), D_SKL_PLUS);
>  	MMIO_D(_MMIO(0x7239c), D_SKL_PLUS);
> -	MMIO_D(_MMIO(0x7039c), D_SKL_PLUS);
> +	MMIO_D(_MMIO(_PLANE_SURF_3_A), D_SKL_PLUS);
> =20
> -	MMIO_D(_MMIO(0x8f074), D_SKL_PLUS);
> -	MMIO_D(_MMIO(0x8f004), D_SKL_PLUS);
> -	MMIO_D(_MMIO(0x8f034), D_SKL_PLUS);
> +	MMIO_D(CSR_SSP_BASE, D_SKL_PLUS);
> +	MMIO_D(CSR_HTP_SKL, D_SKL_PLUS);
> +	MMIO_D(CSR_LAST_WRITE, D_SKL_PLUS);
> =20
> -	MMIO_D(_MMIO(0xb11c), D_SKL_PLUS);
> +	MMIO_D(BDW_SCRATCH1, D_SKL_PLUS);
> =20
> -	MMIO_D(_MMIO(0x51000), D_SKL_PLUS);
> -	MMIO_D(_MMIO(0x6c00c), D_SKL_PLUS);
> +	MMIO_D(SKL_DFSM, D_SKL_PLUS);
> +	MMIO_D(DISPIO_CR_TX_BMU_CR0, D_SKL_PLUS);
> =20
> -	MMIO_F(_MMIO(0xc800), 0x7f8, F_CMD_ACCESS, 0, 0, D_SKL_PLUS,
> +	MMIO_F(GEN9_GFX_MOCS(0), 0x7f8, F_CMD_ACCESS, 0, 0, D_SKL_PLUS,
>  		NULL, NULL);
> -	MMIO_F(_MMIO(0xb020), 0x80, F_CMD_ACCESS, 0, 0, D_SKL_PLUS,
> +	MMIO_F(GEN7_L3CNTLREG2, 0x80, F_CMD_ACCESS, 0, 0, D_SKL_PLUS,
>  		NULL, NULL);
> =20
>  	MMIO_D(RPM_CONFIG0, D_SKL_PLUS);
>  	MMIO_D(_MMIO(0xd08), D_SKL_PLUS);
>  	MMIO_D(RC6_LOCATION, D_SKL_PLUS);
> -	MMIO_DFH(_MMIO(0x20e0), D_SKL_PLUS, F_MODE_MASK, NULL, NULL);
> -	MMIO_DFH(_MMIO(0x20ec), D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
> +	MMIO_DFH(GEN7_FF_SLICE_CS_CHICKEN1, D_SKL_PLUS, F_MODE_MASK,
> +		NULL, NULL);
> +	MMIO_DFH(GEN9_CS_DEBUG_MODE1, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>  		NULL, NULL);
> =20
>  	/* TRTT */
> -	MMIO_DFH(_MMIO(0x4de0), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> -	MMIO_DFH(_MMIO(0x4de4), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> -	MMIO_DFH(_MMIO(0x4de8), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> -	MMIO_DFH(_MMIO(0x4dec), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> -	MMIO_DFH(_MMIO(0x4df0), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> -	MMIO_DFH(_MMIO(0x4df4), D_SKL_PLUS, F_CMD_ACCESS,
> +	MMIO_DFH(TRVATTL3PTRDW(0), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> +	MMIO_DFH(TRVATTL3PTRDW(1), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> +	MMIO_DFH(TRVATTL3PTRDW(2), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> +	MMIO_DFH(TRVATTL3PTRDW(3), D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> +	MMIO_DFH(TRVADR, D_SKL_PLUS, F_CMD_ACCESS, NULL, NULL);
> +	MMIO_DFH(TRTTE, D_SKL_PLUS, F_CMD_ACCESS,
>  		NULL, gen9_trtte_write);
>  	MMIO_DH(_MMIO(0x4dfc), D_SKL_PLUS, NULL, gen9_trtt_chicken_write);
> =20
> @@ -3011,7 +3012,7 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
>  	MMIO_DH(DMA_CTRL, D_SKL_PLUS, NULL, dma_ctrl_write);
> =20
>  	MMIO_D(_MMIO(0x65900), D_SKL_PLUS);
> -	MMIO_D(_MMIO(0x1082c0), D_SKL_PLUS);
> +	MMIO_D(GEN6_STOLEN_RESERVED, D_SKL_PLUS);
>  	MMIO_D(_MMIO(0x4068), D_SKL_PLUS);
>  	MMIO_D(_MMIO(0x67054), D_SKL_PLUS);
>  	MMIO_D(_MMIO(0x6e560), D_SKL_PLUS);
> @@ -3042,8 +3043,8 @@ static int init_skl_mmio_info(struct intel_gvt *gvt)
>  	MMIO_DFH(GEN9_WM_CHICKEN3, D_SKL_PLUS, F_MODE_MASK | F_CMD_ACCESS,
>  		 NULL, NULL);
> =20
> -	MMIO_D(_MMIO(0x4ab8), D_KBL | D_CFL);
> -	MMIO_D(_MMIO(0x2248), D_SKL_PLUS);
> +	MMIO_D(GAMT_CHKN_BIT_REG, D_KBL);
> +	MMIO_D(GEN9_CTX_PREEMPT_REG, D_KBL | D_SKL);
> =20
>  	return 0;
>  }
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--GUfsrdPq8omuo5Le
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXJ2FvQAKCRCxBBozTXgY
J4W8AJ9QE7PMN8lmy8mJ+0oPYNnxUhTDowCeOPtfuLX+q9I0t3CXKkA+PWC6BLM=
=XuIg
-----END PGP SIGNATURE-----

--GUfsrdPq8omuo5Le--

--===============0098683847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0098683847==--
