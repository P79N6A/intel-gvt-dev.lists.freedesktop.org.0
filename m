Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2560950ywd;
        Sun, 13 Jan 2019 18:39:52 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4BJl75TU/Y+1kYH3yc5B5LGbSGWMQOJibvRDAKnSWeD6LhX3ocOTdQL2kJ/epaxaS6/bGS
X-Received: by 2002:a17:902:aa0a:: with SMTP id be10mr23291610plb.266.1547433592421;
        Sun, 13 Jan 2019 18:39:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547433592; cv=none;
        d=google.com; s=arc-20160816;
        b=FtNePl5v9587SnMNMnS6vfvhwj2vnQXjxtz7Q5Q6u4zmZPCZnuj/tw0crNO1LVfMWT
         fFFPu4UpEo7jKUV0OZp2mYrbMMN20mUq4zNCTCP4O9pNrrKovoWAxUlQarh6n5k5+3ZK
         5B+n2D8crIiCyl22ifiri9uxHGEvuLMuaQxp62oCC4Tp1KBwPvsgIFg0Md3ZuXdzoIyY
         WrloK3toFwCIbZIJjYjyKiTWli5yULZIdyVRfpXck+3rFuzGT+DLmNpNXWArqS2kkn9D
         vteAfDAPy5AK6nfC9iaLJ6KdpRziJ69bjGcvp6yUXs1NZYWYJOvdc/FFuO2jnNepI/bG
         kX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to:subject:delivered-to;
        bh=rOXXOWoriXpNpS61cGHJiTHF5UGqd/ZxQQgAIAOFtyg=;
        b=vjTTwTHASCOJ4x0axCz/LvJ0/DTJ8pycueoAEQ0grEV/hQim2EVHKvJ/75LInQe2iu
         8I89qmnFH4flpyGEdimWBgCzfMc8ODv0kc+3Zh84L+iQPa0xpZE3QOHx0SDvmIg4V+Z3
         q4wuyi13rZP09QhU/NNAOQeVF8SdGkbb13hmLUjUfpPuFj95uUz02ZEdAngCZS/f6B4z
         ZWCACYtodCEqzm+H3nvPNlM65pYpOgJ+1jpkYXSnpnwfTI3sjTDSeSbp0AfLbvh83xmV
         n0+jx8HbdplbI16pP1HKfuA2ZrkzOlyiyxhXG3MxNtIsnlVlbCXtP191jJ0tb8V4nAUm
         f+9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id 21si78990496pgk.74.2019.01.13.18.39.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Jan 2019 18:39:52 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039106E592;
	Mon, 14 Jan 2019 02:39:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90106F819
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Jan 2019 15:32:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 492D6C070E2A;
 Fri, 11 Jan 2019 15:32:56 +0000 (UTC)
Received: from [10.3.116.216] (ovpn-116-216.phx2.redhat.com [10.3.116.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF23260920;
 Fri, 11 Jan 2019 15:32:44 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 1/5] vfio: update kernel headers.
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20190111093116.17188-1-kraxel@redhat.com>
 <20190111093116.17188-2-kraxel@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
 xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
 xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
 TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
 GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
 sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
 AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
 CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
 RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
 wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
 Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
 gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
 pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
 zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
 pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
 3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
 NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
 cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
 SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
 I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
 mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
 Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
 2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <fe14541c-8b57-014c-3972-113ce60161a1@redhat.com>
Date: Fri, 11 Jan 2019 09:32:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190111093116.17188-2-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 11 Jan 2019 15:32:56 +0000 (UTC)
X-Mailman-Approved-At: Mon, 14 Jan 2019 02:39:50 +0000
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0452985092=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0452985092==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6ftLq3SqGbHC44ddIhkBWvDmoeZbgVTgC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6ftLq3SqGbHC44ddIhkBWvDmoeZbgVTgC
Content-Type: multipart/mixed; boundary="rzkoClcvOluPgSS1UataKJ4Q5mqyuSHLi";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org
Message-ID: <fe14541c-8b57-014c-3972-113ce60161a1@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/5] vfio: update kernel headers.
References: <20190111093116.17188-1-kraxel@redhat.com>
 <20190111093116.17188-2-kraxel@redhat.com>
In-Reply-To: <20190111093116.17188-2-kraxel@redhat.com>

--rzkoClcvOluPgSS1UataKJ4Q5mqyuSHLi
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/11/19 3:31 AM, Gerd Hoffmann wrote:
> Temporary, for testing convinience.

convenience

>=20
> Once qemu master is synced with the linux 5.0-rc1 headers
> this is not needed any more.

What's the timeline for when that patch will happen, compared to whether
we want this one now followed by a revert?

>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  linux-headers/linux/vfio.h | 50 ++++++++++++++++++++++++++++++++++++++=
++++++++
>  1 file changed, 50 insertions(+)


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--rzkoClcvOluPgSS1UataKJ4Q5mqyuSHLi--

--6ftLq3SqGbHC44ddIhkBWvDmoeZbgVTgC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlw4txwACgkQp6FrSiUn
Q2rwFgf/ZfQrs5rrD83kPVbH0sjVvwjb5VK4A2DLqvR7XY+dSINjvo6dwZE4Z+lY
gEEa9fL0hfYHuZINu1cvpW+CiQyTy/E+DgTQup3lGVYyCp2GHXI0cdcb6OKbTpzH
riea6rFdSrfwMsFAhzYgnptFIS+vh54oesVhmCVBdVhz5E0ZG/32LFIobAYinxG4
PQ/y/SFRiEf9fgTIbXTbnH+2ErByYQktvvrSq5olrKEzl9UeK6cZn+/+H9j3AcNA
Z64Jl+AVmKBphuajlKJ4TA7vXovtpnGA+NYXwW0Git7Czhd+Ze/NIte5Ji6v5U5W
SZhyIhdsnAluk+MezUe4AeNfiEWClw==
=ZWIT
-----END PGP SIGNATURE-----

--6ftLq3SqGbHC44ddIhkBWvDmoeZbgVTgC--

--===============0452985092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============0452985092==--
