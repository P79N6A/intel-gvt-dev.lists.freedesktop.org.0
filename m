Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2293897ywo;
        Tue, 2 Apr 2019 20:59:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVFt5H/ZzE8nW9AqQ7XHl1GJxNyRB2nv+PU4J4YZr9GDk1+gN5+iRf5xGN91V6LfuWcqqX
X-Received: by 2002:a62:a513:: with SMTP id v19mr16051765pfm.212.1554263967954;
        Tue, 02 Apr 2019 20:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554263967; cv=none;
        d=google.com; s=arc-20160816;
        b=y9ZLsF0Usu2lRV3TJhDmwtB1VJwhr/PMRTtvwBmmlYWhhTbhOnFWRb+W9YfVvWRCRQ
         eTQDEhOQohCY2A0ikd9hPyfwcOgs4jhieMsWq14bo4YsF6Diy8TBZ6eOAJMXmI3A0tSI
         hB/U4pnsDEXlAE7z8gU80YsPUboGoFHpfrLo2tnpw+Q+HiBJLB7evGtMPF/rTmQ4ZnpC
         zzOQg68IFJ4alfDxNRtzZ/60LJ5Rh27QzSXz/im0U9IWM6EplB41r15Pcq2V5j0b/WtK
         qhR0U04MgZGkP8W1rlTkhdAMPA1T/pKAUOA72d7tZkRDTdeqGkQ7fSCc1ahVbBDxrdB2
         lT/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=DnmXf5QN49gmHhV1Kw/6LR1EnUHUzOGrdIr4HlTTxlU=;
        b=Wz+fV+lL3xvdY4YdeXMyE7NdKfrsKM9cH8WPs3yK35rjX2mPBSnBmALOSe4gyd7Gke
         voOpQITT0NGB4PT/dhclPZAGAIwqnbjyUoIug7z8mILa1yTxMMiUZ0nuE01drQpS0XS7
         CJtod/Uxt+/3kCI1WwRy7Vg5mbgGGIyMM8jdc1MjI6SXUEW971aiJc8QvyQSakAhBYyk
         +rau6TfgChVAHYo6XZHjFyDFzHocLYWYPnHMXVUnHeSXlYGT184S2NT1Vqxv7HMVSHAK
         EPDAov7TWkp8+KFbkPwrnyKhiqm8hXvpy3bR0msIMPLiFr9V9cJm6RSFtc41Es46qTVm
         Wy/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id q2si12767703pgc.507.2019.04.02.20.59.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2019 20:59:27 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD3C6E4A2;
	Wed,  3 Apr 2019 03:59:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C036E4A2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2019 03:59:25 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Apr 2019 20:59:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,303,1549958400"; 
 d="asc'?scan'208";a="132500114"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga006.jf.intel.com with ESMTP; 02 Apr 2019 20:59:24 -0700
Date: Wed, 3 Apr 2019 11:48:21 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: addressed guest GPU hang with HWS index mode
Message-ID: <20190403034821.GH2322@zhen-hp.sh.intel.com>
References: <20190403033117.8289-1-xiaolin.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190403033117.8289-1-xiaolin.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1184963594=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1184963594==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bFsKbPszpzYNtEU6"
Content-Disposition: inline


--bFsKbPszpzYNtEU6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.03 11:31:17 +0800, Xiaolin Zhang wrote:
> with the introduce of "switch to use HWS indices rather than address",
> guest GPU hang observed when running workloads which will update the
> seqno to the real HW HWSP, not vitural GPU HWSP and then cause GPU hang.
>=20
> this patch is to revoke index mode in PIPE_CTRL and MI_FLUSH_DW and
> patch guest GPU HWSP address value to these commands.
>=20
> Fixes: 54939ea0b("drm/i915: Switch to use HWS indices rather than
> addresses")
>=20
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index b420919279c7..f976777d7bd5 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -1070,6 +1070,18 @@ static struct cmd_interrupt_event cmd_interrupt_ev=
ents[] =3D {
>  	},
>  };
> =20
> +static int index_mode_to_gma(struct parser_exec_state *s, u32 index)
> +{
> +	u32 gma;
> +	u32 val;
> +
> +	gma =3D s->vgpu->hws_pga[s->ring_id] + index;
> +	patch_value(s, cmd_ptr(s, 2), gma);
> +	val =3D cmd_val(s, 1) & (~PIPE_CONTROL_STORE_DATA_INDEX);
> +	patch_value(s, cmd_ptr(s, 1), val);

MI_FLUSH_DW uses dword 1 for GMA address or index instead of dword 2, altho=
ugh
index mode flag for them is both at dword 1, but address offset is differen=
t,
and MI_FLUSH_DW has GGTT/PPGTT flag value in dword 1 which should be preser=
ved.
Looks better just handle in their handlers.

> +	return 0;
> +}
> +
>  static int cmd_handler_pipe_control(struct parser_exec_state *s)
>  {
>  	int gmadr_bytes =3D s->vgpu->gvt->device_info.gmadr_bytes_in_cmd;
> @@ -1098,8 +1110,11 @@ static int cmd_handler_pipe_control(struct parser_=
exec_state *s)
>  				/* Store Data Index */
>  				if (cmd_val(s, 1) & (1 << 21))
>  					index_mode =3D true;
> -				ret |=3D cmd_address_audit(s, gma, sizeof(u64),
> -						index_mode);
> +				if (index_mode)
> +					ret =3D index_mode_to_gma(s, gma);
> +				else
> +					ret |=3D cmd_address_audit(s, gma,
> +						sizeof(u64), index_mode);
>  			}
>  		}
>  	}
> @@ -1607,7 +1622,11 @@ static int cmd_handler_mi_flush_dw(struct parser_e=
xec_state *s)
>  		/* Store Data Index */
>  		if (cmd_val(s, 0) & (1 << 21))
>  			index_mode =3D true;
> -		ret =3D cmd_address_audit(s, gma, sizeof(u64), index_mode);
> +		if (index_mode)
> +			ret =3D index_mode_to_gma(s, gma);
> +		else
> +			ret =3D cmd_address_audit(s, gma,
> +					sizeof(u64), index_mode);
>  	}
>  	/* Check notify bit */
>  	if ((cmd_val(s, 0) & (1 << 8)))
> --=20
> 2.15.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--bFsKbPszpzYNtEU6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXKQtBQAKCRCxBBozTXgY
J0cfAJ0a7B7SObEVqYneu/09oH8e6w0RgACghp4mBaAAoAMMSzdziU5mYknUMts=
=QSQl
-----END PGP SIGNATURE-----

--bFsKbPszpzYNtEU6--

--===============1184963594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1184963594==--
