Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp3996642ywb;
        Wed, 13 Mar 2019 12:15:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw+IgFb+GETAQRJedJIgQXwFt4cZefpiGh/vHrv6952OXFHPfdvTHbH2b2JzrnNl+XjXUQk
X-Received: by 2002:a65:5184:: with SMTP id h4mr41531868pgq.32.1552504501188;
        Wed, 13 Mar 2019 12:15:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552504501; cv=none;
        d=google.com; s=arc-20160816;
        b=f6X4AW+ze65FKNxYNsqkLAZXGvPth1tNd4diLs3SPi79eiWg9Sv25sEZGEmqNJ+Whg
         wVdy5D8kVmYJPzB1QK++6by1bF3heipz0SGnD0I74SRTf+8T0G1l9XiI6oIkazP9gQTe
         gbThi1Y0cC85h8Be3SKMpES+wpClw2T8XdBYa8XAXTl+IQqnfXOXYGy2VyIRBpkXLlMk
         Od0OfIXF6CUbuj5kSrHpXWPjJY+TiN6igTGfQRMWlS9lpksxAIpfIjLQnc9eH0EhfCi3
         63TNZH53yWRmLhQ/jAQ5dNX6mF92a+HPWzspFlwaLIDgbCDYb2vfmXlnC6svVe61wz72
         2KMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:subject
         :to:from:date:delivered-to;
        bh=PAJVTYX6P0tq+qVqYaK0uYaDiqWRzpxJooN3kFlZAIM=;
        b=mQjsO/X6nrd5NukzCrC2eWiD4i1b1bijaiHNeUJWCyf/oy3fIl6gE3J3NnjHzZNsif
         9bPkprQGg/upqueDxjiLJTAbmJ8/5daNZHfAlQQFcA4IMf9ifc9W0ONOsFqvYy5744s2
         GZDkd+rI9HXIekj/YB9nc3HDP/G3Mz3p6Orb/DO4iVVNON6bm17aVDMdBeLkfN1E0T8X
         76UWRslcPvKaT+VGLcHsGK3iuUZovzZsqdL+DEDVs8m6f7H8w4rIfHnBVFARm3iFFcCw
         4TN2RWmMBpR0APGYT78YIQgCnFyjEScGH78u5ecG78szcGYulCA37NWFx9h9DhnK3bPK
         ecxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id 59si11988312plp.100.2019.03.13.12.14.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2019 12:15:01 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BAA6E0EA;
	Wed, 13 Mar 2019 19:14:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5852F6E0EA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 13 Mar 2019 19:14:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 972CA3089E65;
 Wed, 13 Mar 2019 19:14:57 +0000 (UTC)
Received: from w520.home (ovpn-116-24.phx2.redhat.com [10.3.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAC9D5D73D;
 Wed, 13 Mar 2019 19:14:54 +0000 (UTC)
Date: Wed, 13 Mar 2019 13:14:54 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Zhao Yan <yan.y.zhao@intel.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190313131454.09f886c1@w520.home>
In-Reply-To: <20190313011301.GA16072@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190221134051.2c28893e@w520.home>
 <20190225022255.GP16456@joy-OptiPlex-7040>
 <20190307104421.534ea56f@w520.home>
 <20190312025747.GI21353@joy-OptiPlex-7040>
 <20190313011301.GA16072@joy-OptiPlex-7040>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 13 Mar 2019 19:14:57 +0000 (UTC)
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi
 L" <yi.l.liu@intel.com>, "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Wang, 
 Zhi A" <zhi.a.wang@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAxMiBNYXIgMjAxOSAyMToxMzowMSAtMDQwMApaaGFvIFlhbiA8eWFuLnkuemhhb0Bp
bnRlbC5jb20+IHdyb3RlOgoKPiBoaSBBbGV4Cj4gQW55IGNvbW1lbnRzIHRvIHRoZSBzZXF1ZW5j
ZSBiZWxvdz8KPiAKPiBBY3RhdWxseSB3ZSBoYXZlIHNvbWUgY29uY2VybnMgYW5kIHN1Z2dlc3Rp
b25zIHRvIHVzZXJzcGFjZS1vcGFxdWUgbWlncmF0aW9uCj4gZGF0YS4KPiAKPiAxLiBpZiBkYXRh
IGlzIG9wYXF1ZSB0byB1c2Vyc3BhY2UsIGtlcm5lbCBpbnRlcmZhY2UgbXVzdCBiZSB0aWdodGx5
IGJvdW5kIHRvCj4gbWlncmF0aW9uLiAKPiAgICBlLmcuIHZlbmRvciBkcml2ZXIgaGFzIHRvIGtu
b3cgc3RhdGUgKHJ1bm5pbmcgKyBub3QgbG9nZ2luZykgc2hvdWxkIG5vdAo+ICAgIHJldHVybiBh
bnkgZGF0YSwgYW5kIHN0YXRlIChydW5uaW5nICsgbG9nZ2luZykgc2hvdWxkIHJldHVybiB3aG9s
ZQo+ICAgIHNuYXBzaG90IGZpcnN0IGFuZCBkaXJ0eSBsYXRlci4gaXQgYWxzbyBoYXMgdG8ga25v
dyBxZW11IG1pZ3JhdGlvbiB3aWxsCj4gICAgbm90IGNhbGwgR0VUX0JVRkZFUiBpbiBzdGF0ZSAo
cnVubmluZyArIG5vdCBsb2dnaW5nKSwgb3RoZXJ3aXNlLCBpdCBoYXMKPiAgICB0byBhZGp1c3Qg
aXRzIGJlaGF2aW9yLgoKVGhpcyBhbGwganVzdCBzb3VuZHMgbGlrZSBkZWZpbmluZyB0aGUgcHJv
dG9jb2wgd2UgZXhwZWN0IHdpdGggdGhlCmludGVyZmFjZS4gIEZvciBpbnN0YW5jZSBpZiB3ZSBk
ZWZpbmUgYSBzZXNzaW9uIGFzIGJlZ2lubmluZyB3aGVuCmxvZ2dpbmcgaXMgZW5hYmxlZCBhbmQg
ZW5kaW5nIHdoZW4gdGhlIGRldmljZSBpcyBzdG9wcGVkIGFuZCB0aGUKaW50ZXJmYWNlIHJlcG9y
dHMgbm8gbW9yZSBkYXRhIGlzIGF2YWlsYWJsZSwgdGhlbiB3ZSBjYW4gc3RhdGUgdGhhdCBhbnkK
cGFydGlhbCBhY2N1bXVsYXRpb24gb2YgZGF0YSBpcyBpbmNvbXBsZXRlIHJlbGF0aXZlIHRvIG1p
Z3JhdGlvbi4gIElmCnVzZXJzcGFjZSB3YW50cyB0byBpbml0aWF0ZSBhIG5ldyBtaWdyYXRpb24g
c3RyZWFtLCB0aGV5IGNhbiBzaW1wbHkKdG9nZ2xlIGxvZ2dpbmcuICBIb3cgdGhlIHZlbmRvciBk
cml2ZXIgcHJvdmlkZXMgdGhlIGRhdGEgZHVyaW5nIHRoZQpzZXNzaW9uIGlzIG5vdCBkZWZpbmVk
LCBidXQgYmVnaW5uaW5nIHRoZSBzZXNzaW9uIHdpdGggYSBzbmFwc2hvdApmb2xsb3dlZCBieSBy
ZXBlYXRlZCBpdGVyYXRpb25zIG9mIGRpcnRpZWQgZGF0YSBpcyBjZXJ0YWlubHkgYSB2YWxpZAph
cHByb2FjaC4KCj4gMi4gdmVuZG9yIGRyaXZlciBjYW5ub3QgZW5zdXJlIHVzZXJzcGFjZSBnZXQg
YWxsIHRoZSBkYXRhIGl0IGludGVuZHMgdG8KPiBzYXZlIGluIHByZS1jb3B5IHBoYXNlLgo+ICAg
ZS5nLiBpbiBzdG9wLWFuZC1jb3B5IHBoYXNlLCB2ZW5kb3IgZHJpdmVyIGhhcyB0byBmaXJzdCBj
aGVjayBhbmQgc2VuZAo+ICAgZGF0YSBpbiBwcmV2aW91cyBwaGFzZS4KCkZpcnN0LCBJIGRvbid0
IHRoaW5rIHRoZSBkZXZpY2UgaGFzIGNvbnRyb2wgb2Ygd2hlbiBRRU1VIHN3aXRjaGVzIGZyb20K
cHJlLWNvcHkgdG8gc3RvcC1hbmQtY29weSwgdGhlIHByb3RvY29sIG5lZWRzIHRvIHN1cHBvcnQg
dGhhdAp0cmFuc2l0aW9uIGF0IGFueSBwb2ludC4gIEhvd2V2ZXIsIGl0IHNlZW1zIGEgc2ltcGx5
IGRhdGEgYXZhaWxhYmxlCmNvdW50ZXIgcHJvdmlkZXMgYW4gaW5kaWNhdGlvbiBvZiB3aGVuIGl0
IG1pZ2h0IGJlIG9wdGltYWwgdG8gbWFrZSBzdWNoCmEgdHJhbnNpdGlvbi4gIElmIGEgdmVuZG9y
IGRyaXZlciBmb2xsb3dzIGEgc2NoZW1lIGFzIGFib3ZlLCB0aGUKYXZhaWxhYmxlIGRhdGEgY291
bnRlciB3b3VsZCBpbmRpY2F0ZSBhIGxhcmdlIHZhbHVlLCB0aGUgZW50aXJlIGluaXRpYWwKc25h
cHNob3Qgb2YgdGhlIGRldmljZS4gIEFzIHRoZSBtaWdyYXRpb24gY29udGludWVzIGFuZCBwYWdl
cyBhcmUKZGlydGllZCwgdGhlIGRldmljZSB3b3VsZCByZWFjaCBhIHN0ZWFkeSBzdGF0ZSBhbW91
bnQgb2YgZGF0YQphdmFpbGFibGUsIGRlcGVuZGluZyBvbiB0aGUgZ3Vlc3QgYWN0aXZpdHkuICBU
aGlzIGNvdWxkIGluZGljYXRlIHRvIHRoZQp1c2VyIHRvIHN0b3AgdGhlIGRldmljZS4gIFRoZSBt
aWdyYXRpb24gc3RyZWFtIHdvdWxkIG5vdCBiZSBjb25zaWRlcmVkCmNvbXBsZXRlZCB1bnRpbCB0
aGUgYXZhaWxhYmxlIGRhdGEgY291bnRlciByZWFjaGVzIHplcm8gd2hpbGUgdGhlCmRldmljZSBp
cyBpbiB0aGUgc3RvcHBlZHxsb2dnaW5nIHN0YXRlLgoKPiAzLiBpZiBhbGwgdGhlIHNlcXVlbmNl
IGlzIHRpZ2h0bHkgYm91bmQgdG8gbGl2ZSBtaWdyYXRpb24sIGNhbiB3ZSByZW1vdmUgdGhlCj4g
bG9nZ2luZyBzdGF0ZT8gd2hhdCBhYm91dCBhZGRpbmcgdHdvIHN0YXRlcyBtaWdyYXRlLWluIGFu
ZCBtaWdyYXRlLW91dD8KPiBzbyB0aGVyZSBhcmUgZm91ciBzdGF0ZXM6IHJ1bm5pbmcsIHN0b3Bw
ZWQsIG1pZ3JhdGUtaW4sIG1pZ3JhdGUtb3V0Lgo+ICAgIG1pZ3JhdGUtb3V0IGlzIGZvciBzb3Vy
Y2Ugc2lkZSB3aGVuIG1pZ3JhdGlvbiBzdGFydHMuIHRvZ2V0aGVyIHdpdGgKPiAgICBzdGF0ZSBy
dW5uaW5nIGFuZCBzdG9wcGVkLCBpdCBjYW4gc3Vic3RpdHV0ZSBzdGF0ZSBsb2dnaW5nLgo+ICAg
IG1pZ3JhdGUtaW4gaXMgZm9yIHRhcmdldCBzaWRlLgoKSW4gZmFjdCwgS2lydGkncyBpbXBsZW1l
bnRhdGlvbiBzcGVjaWZpZXMgYSBkYXRhIGRpcmVjdGlvbiwgYnV0IEkgdGhpbmsKd2Ugc3RpbGwg
bmVlZCBsb2dnaW5nIHRvIGluZGljYXRlIHNlc3Npb25zLiAgSSdkIGFsc28gYXNzdW1lIHRoYXQK
bG9nZ2luZyBpbXBsaWVzIHNvbWUgb3ZlcmhlYWQgZm9yIHRoZSB2ZW5kb3IgZHJpdmVyLgoKPiBP
biBUdWUsIE1hciAxMiwgMjAxOSBhdCAxMDo1Nzo0N0FNICswODAwLCBaaGFvIFlhbiB3cm90ZToK
PiA+IGhpIEFsZXgKPiA+IHRoYW5rcyBmb3IgeW91ciByZXBseS4KPiA+IAo+ID4gU28sIGlmIHdl
IGNob29zZSBtaWdyYXRpb24gZGF0YSB0byBiZSB1c2Vyc3BhY2Ugb3BhcXVlLCBkbyB5b3UgdGhp
bmsgYmVsb3cKPiA+IHNlcXVlbmNlIGlzIHRoZSByaWdodCBiZWhhdmlvciBmb3IgdmVuZG9yIGRy
aXZlciB0byBmb2xsb3c6Cj4gPiAKPiA+IDEuIGluaXRpYWxseSBMT0dHSU5HIHN0YXRlIGlzIG5v
dCBzZXQuIElmIHVzZXJzcGFjZSBjYWxscyBHRVRfQlVGRkVSIHRvCj4gPiB2ZW5kb3IgZHJpdmVy
LCAgdmVuZG9yIGRyaXZlciBzaG91bGQgcmVqZWN0IGFuZCByZXR1cm4gMC4KCldoYXQgd291bGQg
dGhpcyBzdGF0ZSBtZWFuIG90aGVyd2lzZT8gIElmIHdlJ3JlIG5vdCBsb2dnaW5nIHRoZW4gaXQK
c2hvdWxkIG5vdCBiZSBleHBlY3RlZCB0aGF0IHdlIGNhbiBjb25zdHJ1Y3QgZGlydGllZCBkYXRh
IGZyb20gYQpwcmV2aW91cyByZWFkIG9mIHRoZSBzdGF0ZSBiZWZvcmUgbG9nZ2luZyB3YXMgZW5h
YmxlZCAoaXQgd291bGQgYmUKb3V0c2lkZSBvZiB0aGUgInNlc3Npb24iKS4gIFNvIGF0IGJlc3Qg
dGhpcyBpcyBhbiBpbmNvbXBsZXRlIHNlZ21lbnQgb2YKdGhlIGluaXRpYWwgc25hcHNob3Qgb2Yg
dGhlIGRldmljZSwgYnV0IHRoYXQgcHJlc3VtZXMgaG93IHRoZSB2ZW5kb3IKZHJpdmVyIGNvbnN0
cnVjdHMgdGhlIGRhdGEuICBJIHdvdWxkbid0IG5lY2Vzc2FyaWx5IG1hbmRhdGUgdGhlIHZlbmRv
cgpkcml2ZXIgcmVqZWN0IGl0LCBidXQgSSB0aGluayB3ZSBzaG91bGQgY29uc2lkZXIgaXQgdW5k
ZWZpbmVkIGFuZAp2ZW5kb3Igc3BlY2lmaWMgcmVsYXRpdmUgdG8gdGhlIG1pZ3JhdGlvbiBpbnRl
cmZhY2UuCgo+ID4gMi4gdGhlbiBMT0dHSU5HIHN0YXRlIGlzIHNldCwgaWYgdXNlcnNwYWNlIGNh
bGxzIEdFVF9CVUZGRVIgdG8gdmVuZG9yCj4gPiBkcml2ZXIsCj4gPiAgICBhLiB2ZW5kb3IgZHJp
dmVyIHNob3VkIGZpcnN0IHF1ZXJ5IGEgd2hvbGUgc25hcHNob3Qgb2YgZGV2aWNlIG1lbW9yeQo+
ID4gICAgKGxldCdzIHVzZSB0aGlzIHRlcm0gdG8gcmVwcmVzZW50IGRldmljZSdzIHN0YW5kYWxv
bmUgbWVtb3J5IGZvciBub3cpLAo+ID4gICAgYi4gdmVuZG9yIGRyaXZlciByZXR1cm5zIGEgY2h1
bmsgb2YgZGF0YSBqdXN0IHF1ZXJpZWQgdG8gdXNlcnNwYWNlLAo+ID4gICAgd2hpbGUgcmVjb3Jk
aW5nIGN1cnJlbnQgcG9zIGluIGRhdGEuCj4gPiAgICBjLiB2ZW5kb3IgZHJpdmVyIGZpbmRzIGFs
bCBkYXRhIGp1c3QgcXVlcmllZCBpcyBmaW5pc2hlZCB0cmFuc21pdHRpbmcgdG8KPiA+ICAgIHVz
ZXJzcGFjZSwgYW5kIHF1ZXJpZXMgb25seSBkaXJ0eSBkYXRhIGluIGRldmljZSBtZW1vcnkgbm93
Lgo+ID4gICAgZC4gdmVuZG9yIGRyaXZlciByZXR1cm5zIGEgY2h1bmsgb2YgZGF0YSBqdXN0IHF1
ZXJlZCAodGhpcyB0aW1lIGlzIGRpcnR5Cj4gPiAgICBkYXRhICl0byB1c2Vyc3BhY2Ugd2hpbGUg
cmVjb3JkaW5nIGN1cnJlbnQgcG9zIGluIGRhdGEKPiA+ICAgIGUuIGlmIGFsbCBkYXRhIGlzIHRy
YW5zbWl0ZWQgdG8gdXNlc3BhY2UgYW5kIHN0aWxsIEdFVF9CVUZGRVJzIGNvbWUgZnJvbQo+ID4g
ICAgdXNlcnNwYWNlLCB2ZW5kb3IgZHJpdmVyIHN0YXJ0cyBhbm90aGVyIHJvdW5kIG9mIGRpcnR5
IGRhdGEgcXVlcnkuCgpUaGlzIGlzIGEgdmFsaWQgdmVuZG9yIGRyaXZlciBhcHByb2FjaCwgYnV0
IGl0J3Mgb3V0c2lkZSB0aGUgc2NvcGUgb2YKdGhlIGludGVyZmFjZSBkZWZpbml0aW9uLiAgQSB2
ZW5kb3IgZHJpdmVyIGNvdWxkIGFsc28gZGVjaWRlIHRvIG5vdApwcm92aWRlIGFueSBkYXRhIHVu
dGlsIGJvdGggc3RvcHBlZCBhbmQgbG9nZ2luZyBhcmUgc2V0IGFuZCB0aGVuCnByb3ZpZGUgYSBm
aXhlZCwgZmluYWwgc25hcHNob3QuICBUaGUgaW50ZXJmYWNlIHN1cHBvcnRzIGVpdGhlcgphcHBy
b2FjaCBieSBkZWZpbmluZyB0aGUgcHJvdG9jb2wgdG8gaW50ZXJhY3Qgd2l0aCBpdC4KCj4gPiAz
LiBpZiBMT0dHSU5HIHN0YXRlIGlzIHVuc2V0IHRoZW4sIGFuZCB1c2VycGFjZSBjYWxscyBHRVRf
QlVGRkVSIHRvIHZlbmRvcgo+ID4gZHJpdmVyLAo+ID4gICAgYS4gaWYgdmVuZG9yIGRyaXZlciBm
aW5kcyB0aGVyZSdzIHByZXZpb3VzbHkgdW50cmFuc21pdHRlZCBkYXRhLCByZXR1cm5zCj4gPiAg
ICB0aGVtIHVudGlsIGFsbCB0cmFuc21pdHRlZC4KPiA+ICAgIGIuIHZlbmRvciBkcml2ZXIgdGhl
biBxdWVyaWVzIGRpcnR5IGRhdGEgYWdhaW4gYW5kIHRyYW5zbWl0cyB0aGVtLgo+ID4gICAgYy4g
YXQgbGFzdCwgdmVuZG9yIGRyaXZlciBxdWVyaXMgZGV2aWNlIGNvbmZpZyBkYXRhICh3aGljaCBo
YXMgdG8gYmUKPiA+ICAgIHF1ZXJpZWQgYXQgbGFzdCBhbmQgc2VudCBvbmNlKSBhbmQgdHJhbnNt
aXRzIHRoZW0uCgpUaGlzIHNlZW1zIGJyb2tlbiwgdGhlIHZlbmRvciBkcml2ZXIgaXMgcHJlc3Vt
aW5nIHRoZSB1c2VyIGludGVudGlvbnMuCklmIGxvZ2dpbmcgaXMgdW5zZXQsIHdlIHJldHVybiB0
byBidWxsZXQgMSwgcmVhZGluZyBkYXRhIGlzIHVuZGVmaW5lZAphbmQgdmVuZG9yIHNwZWNpZmlj
LiAgSXQncyBvdXRzaWRlIG9mIHRoZSBzZXNzaW9uLgoKPiA+IGZvciB0aGUgMSBidWxsZXQsIGlm
IExPR0dJTkcgc3RhdGUgaXMgZmlyc3RseSBzZXQgYW5kIG1pZ3JhdGlvbiBhYm9ydHMKPiA+IHRo
ZW4sICB2ZW5kb3IgZHJpdmVyIGhhcyB0byBiZSBhYmxlIHRvIGRldGVjdCB0aGF0IGNvbmRpdGlv
bi4gc28gc2VlbWluZ2x5LAo+ID4gdmVuZG9yIGRyaXZlciBoYXMgdG8ga25vdyBtb3JlIHFlbXUn
cyBtaWdyYXRpb24gc3RhdGUsIGxpa2UgbWlncmF0aW9uCj4gPiBjYWxsZWQgYW5kIGZhaWxlZC4g
RG8geW91IHRoaW5rIHRoYXQncyBhY2NlcHRhYmxlPwoKSWYgbWlncmF0aW9uIGFib3J0cywgbG9n
Z2luZyBpcyBjbGVhcmVkIGFuZCB0aGUgZGV2aWNlIGNvbnRpbnVlcwpvcGVyYXRpb24uICBJZiBh
IG5ldyBtaWdyYXRpb24gaXMgc3RhcnRlZCwgdGhlIHNlc3Npb24gaXMgaW5pdGlhdGVkIGJ5CmVu
YWJsaW5nIGxvZ2dpbmcuICBTb3VuZCByZWFzb25hYmxlPyAgVGhhbmtzLAoKQWxleApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1h
aWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
