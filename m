Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp7500644ywe;
        Thu, 7 Mar 2019 18:14:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqxG0fjo00iIsI9v1TX3ggrYiP0ujaWUgTckXemjDnXi6NRhjNwDU/QSQwDVa/jOZ+EUJCM4
X-Received: by 2002:a63:2141:: with SMTP id s1mr14046727pgm.363.1552011259625;
        Thu, 07 Mar 2019 18:14:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552011259; cv=none;
        d=google.com; s=arc-20160816;
        b=Zv7jNKnOJ/klnGF/gw7WfixVLLCNz2vs12AYkMzYh2kXsDaXZexpiBreQmw7xzSMzU
         J6XGb27iFcBXyrdccCj/qgg8P7xXZ1aS8WS2BU2cTEZfP4pjbe2yk1rS9r4g4AkWOfdH
         UekGnjO648pVplUAK8rXhxUePfYixXBnLyajD+6DJvxMebQmNZZdOq7CdqZgxRtrO0Y+
         TLSi7g1sKmFrzcJ4I+lQEXW22+pQ/gs8DBu4MymdCGX9+2iqslPnT8lUXXPT8FaXcycY
         mdn1ss67CnmzpwIqe1I8cUTTkXsnkp7vDtiO8/kUJndxenovpZ9epP2zg6rRX21Rqcd0
         cK9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=/aroqt+f35H3XDdCIJl3P9/pcdR0Kl73bo/kWPV2Kt0=;
        b=pZucFN9ONR4C/tcdzGiVuYaO4dvpszkXOYnYf9wUhPmRohFpbFETcP5bGBTo4bYBNi
         ryVGe33/ZBHxpuOMzGmpYx1hBzR4tEJ/NxBZihqnwYtc0izou2yB7+O4OSb/nPDXnVmP
         ERmuzPUa62cH+NlsqhISy3m3reUwhz5r0/R538ScSTZJHqY9+NMJuEOAVS3xAoL4jDcd
         trqfoMWeByEiVYcV4V7eQPfJoDiqwJqvBysBKRv1opNMS/ORYArINyUrwob6S/Whvixb
         90gP0hRgw+dOoqWxqL/F1zbOQXqtxK1aElmPoAOXrm5/0W5cJ1lmk6IdaxdFJcdZihxM
         2fSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id f65si5839830pff.195.2019.03.07.18.14.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2019 18:14:19 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02F86E261;
	Fri,  8 Mar 2019 02:14:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2586E261;
 Fri,  8 Mar 2019 02:14:17 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2019 18:14:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,454,1544515200"; 
 d="asc'?scan'208";a="325283583"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga006.fm.intel.com with ESMTP; 07 Mar 2019 18:14:14 -0800
Date: Fri, 8 Mar 2019 10:04:08 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-fixes for 5.1-rc1
Message-ID: <20190308020408.GX12380@zhen-hp.sh.intel.com>
References: <20190307060810.GT12380@zhen-hp.sh.intel.com>
 <20190307234435.GB13329@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190307234435.GB13329@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============0812434208=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0812434208==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KygVa1W36dbi1blP"
Content-Disposition: inline


--KygVa1W36dbi1blP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.07 15:44:35 -0800, Rodrigo Vivi wrote:
> On Thu, Mar 07, 2019 at 02:08:10PM +0800, Zhenyu Wang wrote:
> >=20
> > Hi,
> >=20
> > Here's gvt-fixes for 5.1-rc1.
>=20
> I'm kind of confused here. this should be -next-fixes right?
>

oops, you're right, it should be -next-fixes

> $ dim apply-pull drm-intel-next-fixes
>=20
> Pulling https://github.com/intel/gvt-linux.git tags/gvt-fixes-2019-03-07 =
=2E..
> From https://github.com/intel/gvt-linux
>  * tag                         gvt-fixes-2019-03-07 -> FETCH_HEAD
> dim: Pull request contains commits from drm/drm-fixes
> dim: Please backmerge first
> dim: ERROR: Issues in pull request detected, aborting
>=20
> or am I missing something?

I generated against drm-intel-fixes, will resend for -next-fixes.

Thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--KygVa1W36dbi1blP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXIHNmAAKCRCxBBozTXgY
J2j7AJ4mwY+6bEUSaw/bu9Ngr+b9PToubgCggSg8ovNK5NCCdf3O5arOBnrcGvg=
=/QCn
-----END PGP SIGNATURE-----

--KygVa1W36dbi1blP--

--===============0812434208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0812434208==--
