Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp1042762ywe;
        Thu, 21 Feb 2019 21:28:35 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbIoBKgDOntCKmiznNDme6wEnC7jXAmdNFGzE6Avl34ufN4pjQ1ZTtOBTNhuwRFoqMNpM5y
X-Received: by 2002:a63:d49:: with SMTP id 9mr2264773pgn.27.1550813315591;
        Thu, 21 Feb 2019 21:28:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550813315; cv=none;
        d=google.com; s=arc-20160816;
        b=0yG/HdZhvarYqTvI6M1IhteGE2QVaDO3rd3g/vOujm6vzs9PWSnqRXOkY+oRfdl68p
         naqwQUi9bcpivYNTTrDXn7SGKOJYb1MKtfMClBb9Ur4Twq4n4nQgWU+AusKpkGqhL6Pd
         ayavKgCi3Lx+0Z7r98mn0wffG2r586gvW9G/4eJdNs17UCtYcWctSAjo/Zc3HFmdGKSC
         6f+ucKLAf5zbsgPvb7jVSDfaxPPoY4f1S0JXM79oYZUKneoJE5K8qbQWgicUCgPCAvh6
         N+pzLh1x0DQEZvqJ0fko5yEALfk2n4vMO8URmM2NGTiwEmgHM5AFDsXwSVub1bUPhMlp
         anvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=rXWC81uoaXSTt474PShDoPBq54ufeqK5Dgp1iw56JI4=;
        b=wG5xk+0hUIpUXVeQ71CRWxz9/VKWdxLg7ZUnohIQqXBN7wIot8AVTaJQovgRwOKTsd
         XGbvyagUPfGUZniEofpsiKH8Jeow+5q7Re4q0SGSCDL5CJCNXb+zPpp/fxyPuMfn3eAq
         p6wkkjBImDqkaRHBPTroPJRtL3dJBl1s8rUqf/hT7ZI57hjTM7BTRp8QFJa7Sf3al2Tk
         Sf+AG9VcW78RJA5Yf4xbV6FWsvB2G2nySsZcCYa8AOroGHV62PCz71OVnuczx006fAAB
         aZwHWXOZ8Ta8WjucjPBcKKDguSSTS/capOHVEWfvQMunrd56cQOm+j/PHeK3nnBhI/U/
         87uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id l85si540356pfi.272.2019.02.21.21.28.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Feb 2019 21:28:35 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CCA89225;
	Fri, 22 Feb 2019 05:28:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED8F89225
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Feb 2019 05:28:33 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2019 21:28:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,398,1544515200"; 
 d="asc'?scan'208";a="140684003"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga001.jf.intel.com with ESMTP; 21 Feb 2019 21:28:32 -0800
Date: Fri, 22 Feb 2019 13:18:55 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: Windows 10 VM blacked-out text
Message-ID: <20190222051855.GV12380@zhen-hp.sh.intel.com>
References: <20190221084307.53322ef9@w520.home>
MIME-Version: 1.0
In-Reply-To: <20190221084307.53322ef9@w520.home>
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
Content-Type: multipart/mixed; boundary="===============1482338208=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1482338208==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pWAGJYLEitsbNOt2"
Content-Disposition: inline


--pWAGJYLEitsbNOt2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.02.21 08:43:07 -0700, Alex Williamson wrote:
> Hi,
>=20
> I'm running a host kernel based on Linus' tree merged with
> gvt-next-2019-02-01 in order to test EDID support.  QEMU is latest
> qemu.git with Gerd's EDID patches applied.  Guest is Windows 10, fully
> updated, device manager shows Intel graphics driver version
> 25.20.100.6472.  I tried to install the latest DCH Intel graphics
> drivers but if failed to install.  As seen in the attached image, the
> desktop has some fundamental usability issues with certain text fields
> being blacked out.  For this reason I have no idea why the new DCH
> driver failed to install.  How do I get a usable GVT-g VM desktop?
>

We have identified that there's a chicken bit register which could
impact render behavior that need to be restored for different VM.
Colin will send a patch very soon.

Thanks
--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--pWAGJYLEitsbNOt2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXG+GPwAKCRCxBBozTXgY
JzspAJ9Z3EOtei1px42o1Un2dqnfX1qI5ACeNV2O2gxGXqLNrkp4krjOvTn3nyQ=
=07xh
-----END PGP SIGNATURE-----

--pWAGJYLEitsbNOt2--

--===============1482338208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1482338208==--
