Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2395393ywo;
        Mon, 15 Apr 2019 02:55:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx5C9q8uGBGuoqKYwDQApLBReQ8irbrDgwkeLC5A2fg4W01esIeSSwgEZC2yS+pYENfF90y
X-Received: by 2002:a63:c23:: with SMTP id b35mr68010044pgl.298.1555322113655;
        Mon, 15 Apr 2019 02:55:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555322113; cv=none;
        d=google.com; s=arc-20160816;
        b=TmZOTPhf08fsh6qtd6Pew6Ua/XYnfEJILRbKZBxEaqgPmVplQjB6fekQYhriEOxIMo
         AI/usINr+P9LbBJh/x05cQf6U/U2sGzMjz8g1sv8HusqFc4Wgw2JggASP/1m3gya9qi6
         qYl4xKDidWcG1waaIv/MNt7sN8cbA/6lHmEzlqUm4WVRGdw4hTUANeciXRIhBiPUfNdk
         EwjRUZQ35Uu5IBCI1E4V1DODEHtvPnu3/3apyKYaIy8gwsZXDKEbRs9g/oI60nEHRDyx
         FoILkBC/m4NcPGLL5It6JTEvzMFOQn9QaOE+3w/Yqy8VeepstEJCpNqDMSKGgY0D3Z6o
         Eptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to:subject
         :delivered-to;
        bh=rRoYsfF81i4kDst0kf6JqpjoFFAKcDSvWyMj6tE+GX4=;
        b=L3XdpIvCfRhS6eoxPRD+9GJn/4PRHuo/tEyoWpD2/qZzfGws/i2WQW+1ZGyLKujSCi
         3OB+74E+dBFvnNexeEUnFQwZMl8r7P0c37gG8OfdI/Wl4JJYJjmMpYJK5/G9Z/mWMS61
         53C/YswBX9yKT4HSr49KIjaCR5ZwHHO7XLqQC/V/EYjPQD+l4JogZ9HJsyCYT5oytegR
         XUgIh93gQ8xQQApKU9CLoo7e5ExnbLO7jGfvb2VrccLxfhS6tSMgOJ6BUdKp8HUnW1Ql
         7SZzdGGsVgXbyHTe6jHPtJzRgeAGhvoINRa/mUYgmgKCcrmWM7a5Qt10qHn/T117AUUD
         eR2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id j34si43545205pgb.64.2019.04.15.02.55.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Apr 2019 02:55:13 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2A2893D1;
	Mon, 15 Apr 2019 09:55:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1913A893D1;
 Mon, 15 Apr 2019 09:55:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 72B0F3082B6C;
 Mon, 15 Apr 2019 09:55:11 +0000 (UTC)
Received: from lub.tlv (dhcp-4-236.tlv.redhat.com [10.35.4.236])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF138608BF;
 Mon, 15 Apr 2019 09:55:09 +0000 (UTC)
Subject: Re: [PATCH 0/3] i915/gvt/dmabuf: some plane 'size' fixes
To: Zhenyu Wang <zhenyuw@linux.intel.com>
References: <20190414144413.9708-1-uril@redhat.com>
 <20190415021426.GN17995@zhen-hp.sh.intel.com>
From: Uri Lublin <uril@redhat.com>
Organization: Red Hat
Message-ID: <3081fea8-0035-dc0c-93b0-db4a79b828a2@redhat.com>
Date: Mon, 15 Apr 2019 12:55:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190415021426.GN17995@zhen-hp.sh.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 15 Apr 2019 09:55:11 +0000 (UTC)
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
Reply-To: uril@redhat.com
Cc: intel-gfx@lists.freedesktop.org, Snir Sheriber <ssheribe@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gNC8xNS8xOSA1OjE0IEFNLCBaaGVueXUgV2FuZyB3cm90ZToKPiBPbiAyMDE5LjA0LjE0IDE3
OjQ0OjEwICswMzAwLCBVcmkgTHVibGluIHdyb3RlOgo+PiBXZSBzdGFydGVkIGxvb2tpbmcgYXQg
dGhlIGt2bWd0IGRyaXZlciBjb2RlIHdoZW4gd2Ugbm90aWNlZAo+PiB0aGUgJ3NpemUnIGNhbGN1
bGF0aW9uIGluIHFlbXUta3ZtIGlzIHdyb25nLgo+PiBUaGUgZmlyc3QgZml4IHdlIGhhZCBpcyBu
b3cgYWxyZWFkeSBjb21taXR0ZWQgdXBzdHJlYW0KPj4gKDdmMWE5M2IxZjFkMWQyNjAzYTQ5YTll
NDIyNjI1OWRiOTI3MmYzMDUpLgo+PiAgICAgIAo+PiBUaGVyZSBpcyBhIG1pc21hdGNoIGJldHdl
ZW4gdGhlIGNvbW1lbnQgZm9yICdzaXplJyBmaWVsZAo+PiBvZiBzdHJ1Y3QgaW50ZWxfdmdwdV9m
Yl9pbmZvIGFuZCB0aGUgY29kZS4KPj4gVGhlIGNvbW1lbnQgc2F5cyB0aGUgcGxhbmUgc2l6ZSBp
cyBrZXB0IGluIGJ5dGVzLCB3aGlsZQo+PiB0aGUgY29kZSBrZWVwcyBpdCBpbiBwYWdlcy4KPj4g
VGhlc2UgcGF0Y2hlcyBmaXggdGhpcyBwcm9ibGVtIGFzIHdlbGwgYXMgc29tZSByZWxhdGVkCj4+
IGluY29uc2lzdGVuY2llcy4KPiAKPiBXZSBoYXZlIGFub3RoZXIgc2VyaWVzIHRoYXQgd291bGQg
cHV0IHNpemUgYXMgYnl0ZXMgYWN0dWFsbHkuCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3Nlcmllcy81OTI2MC8KCkhpLAoKV2UgZGlkIGxvb2sgYXQgZ3Z0LXN0YWdpbmcgYnJh
bmNoIGJ1dCBub3QgYXQgcGF0Y2h3b3JrLgoKSXQgc2VlbXMgdGhlIGZpZWxkIGRlc2NyaXB0aW9u
IGlzIHN0aWxsIHdyb25nLgpJbiBib3RoIHN0cnVjdHVyZXMsIGl0IHNheXM6CiAgICAiLyogc2l6
ZSBvZiBwbGFuZSBpbiBieXRlcywgYWxpZ24gb24gcGFnZSAqLyIKQnV0IGl0IHNlZW1zIHBvc3Np
YmxlIHRoYXQgdGhlIHZhbHVlIGlzIG5vdCBhbGlnbmVkIG9uIHBhZ2UuCgpUaGFua3MsCiAgICBV
cmkgYW5kIFNuaXIKCj4gCj4gVGhlIGZpcnN0IG9uZSBpcyBhIGZpeCBmb3IgNS4xLCBhbmQgc2Vj
b25kIG9uZSB3b3VsZCBiZSBxdWV1ZWQgZm9yCj4gbmV4dCBrZXJuZWwuCj4gCj4gdGhhbmtzCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1n
dnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1k
ZXY=
