Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp3857ywe;
        Wed, 20 Feb 2019 23:46:48 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ibc61aFZmUqjVAMNa6DQdqjcieyIMAh85ZG2kRi+j9MU9+Q2RmDfZwDJvkL1WdOECq/sZ8Q
X-Received: by 2002:a17:902:c23:: with SMTP id 32mr41774251pls.183.1550735208252;
        Wed, 20 Feb 2019 23:46:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550735208; cv=none;
        d=google.com; s=arc-20160816;
        b=V6gg1nKY9LQyTJXL/KX+1ZbmeQGzB0XnIH7TrlS6y/zSYQdQRsQMoI8f7dQy7CK2e6
         2Uz709OBGSqZAMdN3onzWQK0edRaWGUzzOVB9MzZ3L5w6mq0gVISf55GGOgLrVmE8h47
         9/pNI9tNItnNE6alA64OKIXPDniH7NIjoDUuDI42LnBP4EMchdyFJeQjyQvCF23Nhqt/
         0u14dF0jXs9G1EMFiaNyuu9WrpmrDqi0jsC6g6APrvVzBKfcpQ3CsiBuusr7l8j1Km/+
         odFWIUkW+vlt4qXKdFnZU+Wbmc/47ox+x4NF0w9H8mujwOx/2Nmcye2FP/sWEUrWWzHo
         l5LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=AGFWsFdRa2lSjwoDOAh5gDebZcCEpKre3l3UYUQZPU4=;
        b=MnE6rAX9IGiKrAv6w++zbfNHOEv2+uSHDlai0eMJxgmaW4OCsyZBgN9b/SPi/LfZV0
         kzSR2rhMK6XLwI1EjsrpJ/P5TltoUeSEDNkMQBSiN3zhe0z24Zi/dWEVyAzBu0LSH3m8
         FCNT4Md9H+qZMzVrHD9btV5EyHJuM5ZW3pNrNkzVCYh964LutZBX4uvJV3Mkd2mL579u
         2cjWpkzGkrThW6F9p9J4q0KAWVUwzWJQW+moPjozeTf+iFPBwAoeR23QFbeBoI7kNtOb
         fvS9SSYKLyPQs7adAHUhLiLKZkH39xTFfSA7FrVm66qSoeqZxTQPtnzZ8ou5SOdxpp/v
         PnNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id w24si10171491ply.32.2019.02.20.23.46.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 23:46:48 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91D7892F6;
	Thu, 21 Feb 2019 07:46:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C76892F6
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Feb 2019 07:46:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5530F308FC23;
 Thu, 21 Feb 2019 07:46:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-228.ams2.redhat.com
 [10.36.116.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C22E360BE6;
 Thu, 21 Feb 2019 07:46:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0707811AA4; Thu, 21 Feb 2019 08:46:43 +0100 (CET)
Date: Thu, 21 Feb 2019 08:46:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v2 2/3] vfio/display: add xres + yres properties
Message-ID: <20190221074643.cb6chu3tu7nkytpo@sirius.home.kraxel.org>
References: <20190220084753.9130-1-kraxel@redhat.com>
 <20190220084753.9130-3-kraxel@redhat.com>
 <20190220153602.57a11e97@w520.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190220153602.57a11e97@w520.home>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 21 Feb 2019 07:46:46 +0000 (UTC)
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
Cc: intel-gvt-dev@lists.freedesktop.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiArICAgIERFRklORV9QUk9QX1VJTlQzMigieHJlcyIsIFZGSU9QQ0lEZXZpY2Us
IGRpc3BsYXlfeHJlcywgMCksCj4gPiArICAgIERFRklORV9QUk9QX1VJTlQzMigieXJlcyIsIFZG
SU9QQ0lEZXZpY2UsIGRpc3BsYXlfeXJlcywgMCksCj4gCj4gVGhpcyBpcyBhY3R1YWxseSBxdWl0
ZSBmdW4sIEkgc3RhcnRlZCBteSBWTSB3aXRoIGFyYml0cmFyeSBudW1iZXJzIGFuZAo+IHRoZSBX
aW5kb3dzIEdVSSBob25vcmVkIGl0IGV2ZXJ5IHRpbWUuICBQcm9iYWJseSB2ZXJ5IHVzZWZ1bCBm
b3IKPiBwbGF5aW5nIHdpdGggb2RkIHNjcmVlbiBzaXplcy4gIEkgYWxzbyB0cmllZCB0byBicmVh
ayBpdCB1c2luZwo+IDEwMDAwMDB4MTAwMDAwMCwgYnV0IHRoZSBkaXNwbGF5IGNhbWUgdXAgYXMg
MTkyMHgxMjAwLCB0aGUgbWF4aW11bQo+IHJlc29sdXRpb24gR1ZULWcgc3VwcG9ydHMgZm9yIHRo
aXMgdHlwZS4gIEkgZG9uJ3Qgc2VlIHRoYXQgUUVNVSBpcwo+IGJvdW5kaW5nIHRoaXMgdGhvdWdo
LCBkbyB3ZSBkZXBlbmQgb24gdGhlIG1kZXYgZGV2aWNlIHRvIGlnbm9yZSBpdCBpZgo+IHdlIHBh
c3MgdmFsdWVzIGl0IGNhbm5vdCBzdXBwb3J0PwoKVGhlcmUgaXMgYSBjaGVjayBpbiB2ZmlvX2Rp
c3BsYXlfZWRpZF91cGRhdGUoKS4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdApp
bnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
