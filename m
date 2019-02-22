Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp1051610ywe;
        Thu, 21 Feb 2019 21:43:04 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbZoOw8ghHJNeoT+rMTh6tohkR/JiSR9juHmyTW7iHmw/mzMNGsyyRPXfwk57Pal0qAUD8l
X-Received: by 2002:a63:8bc8:: with SMTP id j191mr2200016pge.234.1550814184376;
        Thu, 21 Feb 2019 21:43:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550814184; cv=none;
        d=google.com; s=arc-20160816;
        b=Q6wKnZJ1xGLbM8UAIg8qVzoPRFz1SywRek7KWe/FhltRNqY+BHSdSaHGs5VEXQmeKH
         G/XS7P1WMZGn+Qn4tF/Hc+NM8ucq3MlJfzMPqQWBHEN6YmG/MEB8Nml3m0UL/dG2/HVp
         os+BNPwBTrxpNjPw3p/HKhgXkG7qWdvLJsBuF9liKqjaNvIVWbUcL4//hauhmOIEheeH
         ug6hlnkuVuZH46YgLTvXCTq8jymwn6pObbD8+enyFZTtXgbySM7Y+NP/uBIGi4BAY0u2
         AP26Tc064CJA0BU0tB+SufamjyilJlGZ8DbelJjnPSVj8lUGao7A3OIENy4kBbHOF7tu
         ZVIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=VtMsHrhsC2dEfZVixrUFP8OAUgFw+amEw1cW/dR0xwE=;
        b=Lhwtt6sAgCpOLtF5gHP/8jxy62BEU8NYk/MwRKZTd7udyuWQPK659AKKMw+ktvKfVX
         5XUmGYzAvOro67MfxNI6fXW6PtSZ3DnBOeTfc3j7Yb2DZSvDzWiHYw1eW1V6lHtDlu9k
         Dc4xnvzAo232lD0+ioFXnug1aLgVz2XCfXraWymBpo6LjqAIBmCUQzMmO2BRA++ZsvG0
         UxZJZ9SpzkCs7X/eGeVPsl8xnfkRzxD9ReemXo9UkThXZ5znX7eSasluyMgRGt1USHGz
         L0stkhagnLQIB5pI5RMLJn6m9VXkVhM4s+TFc4Om3EpfRCmB0sOgoih5zaddiIsXA/9j
         DpBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id c132si514662pga.597.2019.02.21.21.43.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Feb 2019 21:43:04 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6598926B;
	Fri, 22 Feb 2019 05:43:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFD68926B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Feb 2019 05:43:03 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2019 21:43:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,398,1544515200"; 
 d="asc'?scan'208";a="148928265"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2019 21:43:01 -0800
Date: Fri, 22 Feb 2019 13:33:25 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: Windows 10 VM blacked-out text
Message-ID: <20190222053325.GY12380@zhen-hp.sh.intel.com>
References: <20190221084307.53322ef9@w520.home>
 <20190222051855.GV12380@zhen-hp.sh.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190222051855.GV12380@zhen-hp.sh.intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="===============1910285061=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1910285061==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jBGnWEXsPC4kSclK"
Content-Disposition: inline


--jBGnWEXsPC4kSclK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.02.22 13:18:55 +0800, Zhenyu Wang wrote:
> On 2019.02.21 08:43:07 -0700, Alex Williamson wrote:
> > Hi,
> >=20
> > I'm running a host kernel based on Linus' tree merged with
> > gvt-next-2019-02-01 in order to test EDID support.  QEMU is latest
> > qemu.git with Gerd's EDID patches applied.  Guest is Windows 10, fully
> > updated, device manager shows Intel graphics driver version
> > 25.20.100.6472.  I tried to install the latest DCH Intel graphics
> > drivers but if failed to install.  As seen in the attached image, the
> > desktop has some fundamental usability issues with certain text fields
> > being blacked out.  For this reason I have no idea why the new DCH
> > driver failed to install.  How do I get a usable GVT-g VM desktop?
> >
>=20
> We have identified that there's a chicken bit register which could
> impact render behavior that need to be restored for different VM.
> Colin will send a patch very soon.
>=20

Alex, could you try this https://patchwork.freedesktop.org/patch/287394/?
Will merge it, once it passed our CI test, will send pull for upstream.

thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--jBGnWEXsPC4kSclK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXG+JpQAKCRCxBBozTXgY
J/NbAJ0V94AoASGsvnDqpD69sTx2nt9BNACgi5TzyvYYrKZKc5Gj0bHv6GEyiko=
=jC+T
-----END PGP SIGNATURE-----

--jBGnWEXsPC4kSclK--

--===============1910285061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1910285061==--
