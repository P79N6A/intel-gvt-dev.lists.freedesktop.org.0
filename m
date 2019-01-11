Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2743564ywd;
        Fri, 11 Jan 2019 01:16:52 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5xcPU8QFPLfWjdJiK1wMtElqF2GpV0oVMIYsnGTOlIsSb74a44Ax4un1mMU3hH+OYBd2Hw
X-Received: by 2002:a63:83c1:: with SMTP id h184mr6966619pge.437.1547198212131;
        Fri, 11 Jan 2019 01:16:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547198212; cv=none;
        d=google.com; s=arc-20160816;
        b=G4l1WpJK/ARHovvydhPHRLZLZg7B78OmRSjPmBIxMBPy1QiCraaPf6ZooSXhoql4NF
         0DWC+vRB7AfovgkdftrvVl0CRQ/y/yeLjrtlvg5mRpGpdIPt1cxRQv98Yw0W7QZzzDp0
         biRTehgDqT8FyLd+MIaX78xJLlVKcer4NDiSPmBfoFPp+xNnl/uZ4vdat39beIFC/U99
         Orh0zrstaBD6dOSWWDjaz8Ut5R+/u4493/ZwO06Ddd3LCrfUOzH78KqWa0i2uVbjJOV6
         udWZLkcWghyhwlmEnGGFe8h1HsVbGDX4Dfqr7WxByOX/it5evzc2pnuBe5gLGTEgVmOd
         jgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=xw+k545XSXpzDNHvoCQqdAZYfoJYoh0VILqBDJIMVxk=;
        b=PvijVPBsRifMUlQV5XiutwamuVFY5e6ftdC13BhoZnQyb6lZxZMRr74Z1gPD97jnj1
         fh8IIkBmJ8bUNItDLmGhLaTj5iF4fPC8xkdQ1TQ6gzqWnb+GTjyFza5jdaqE6fc22H7k
         tncOICmR8uF9CZQFZbCUjDb6ua3RAT8jDO04MBt62lDzL94UpSwXfaL1Q0LnvcdXNlSk
         ZwajxDk13TqBlqpqnYqmyUolx3m4T+/CYdNutlQYZiHh7NjyV9VmO+2MuaHm03xrtMKH
         Yak2GnDNWlCNX2txeQK+2Ri/QfusYJzlZgOpB0NimVi1BVeNzx8bx6vL4Kjbv12aHOFO
         B4+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id q7si3156557pgl.303.2019.01.11.01.16.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jan 2019 01:16:52 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AA46E712;
	Fri, 11 Jan 2019 09:16:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1066F59E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Jan 2019 09:16:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D1347C057F37;
 Fri, 11 Jan 2019 09:16:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-186.ams2.redhat.com
 [10.36.117.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EB9A5C25A;
 Fri, 11 Jan 2019 09:16:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C18869D85; Fri, 11 Jan 2019 10:16:48 +0100 (CET)
Date: Fri, 11 Jan 2019 10:16:48 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: hang.yuan@linux.intel.com
Subject: Re: [PATCH v1 0/4] drm/i915/gvt: add one VFIO graphics EDID region
Message-ID: <20190111091648.aprmtn3ntfzzy6ht@sirius.home.kraxel.org>
References: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 11 Jan 2019 09:16:49 +0000 (UTC)
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
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCBKYW4gMTAsIDIwMTkgYXQgMDc6MDQ6NDRQTSArMDgwMCwgaGFuZy55dWFuQGxpbnV4
LmludGVsLmNvbSB3cm90ZToKCj4gQ3JlYXRlIG9uZSBWRklPIGdyYXBoaWNzIEVESUQgcmVnaW9u
IGZvciB2Z3B1LiBXaGVuIHRoZSByZWdpb24gaXMgdXBkYXRlZCwKPiBob3RwbHVnIGV2ZW50IGlz
IGVtdWxhdGVkIGZvciBndWVzdCB0byBnZXQgbmV3IEVESUQgZGF0YS4KCldvcmtzIG5pY2VseS4g
IFRlc3RlZCB3aXRoIGthYnkgbGFrZSBob3N0LiAgSSBjYW4gcmVzaXplIHRoZSBzcGljZQpjbGll
bnQgd2luZG93IG9uIHRoZSBob3N0IGFuZCBnbm9tZSBzaGVsbCBpbiB0aGUgZ3Vlc3Qgc3dpdGNo
ZXMgdGhlCnZpZGVvIG1vZGUgYWNjb3JkaW5nbHkuICBDb2RlIGxvb2tzIHNhbmUgdG8gbWUgdG9v
LgoKVmVyeSBjb29sLgoKVGVzdGVkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4KUmV2aWV3ZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgoKcWVtdSB0
ZXN0IGJyYW5jaDoKICBodHRwczovL2dpdC5rcmF4ZWwub3JnL2NnaXQvcWVtdS9sb2cvP2g9c2ly
aXVzL2VkaWQtdmZpbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1ndnQtZGV2Cg==
