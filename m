Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp4028193ywb;
        Wed, 13 Mar 2019 12:57:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxVsdX+2bt93ByIiKfoCQrmRjp1DpPdGYYCzgqGsy4b8UlKAbirBOURMtBBbrDnH/p+ykJg
X-Received: by 2002:a17:902:728a:: with SMTP id d10mr20164537pll.293.1552507040745;
        Wed, 13 Mar 2019 12:57:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552507040; cv=none;
        d=google.com; s=arc-20160816;
        b=E3rNrwE5YZyrngBPUMUqM6WWx4Qg9O+dMV9CRBLe1M5athV5EffX80HCTqAmr03Ff6
         um3YNc1BQp2iQixFevrp739imjSO/ETT6/rqoLFIfutgMrIGC04EMW6r3CavdA1fXUO/
         cz0BxGaeCwI9fJx0wjjRTTbQDvYVD87/3mob6YEiSbwoR3xxYsfg83KzR53+7+feW4oM
         unMolatTT85Ki7Jrcyj5ldLupy63AaRk3SOqz13HKQ35hwZpJHkPXGQNCPQRKVVUjnR3
         0GqMlAlEDliAsTyMV8eJ98wm0ZbANP5/vBPTOTJoKpOgDeUWErsd6JOmEKtrXNuFNHka
         EnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:subject
         :to:from:date:delivered-to;
        bh=+dfKI//0xl5okr5uh9aCpc4glA7lAOIS4O7NCvsED3A=;
        b=cOm6YiacakGocZxw/OWNsUd8QriDAayUWf3XHtXbN3qSnZtLi1bQ3lI6lj432e/VUj
         6q0AX//lzn5pGmDOEZ/SqBQYFBKya9MLLPH72J9ubibnC+lmkOnd/vxnxGwQwRsY+j9c
         QA2fXgs0Yf5IA2lbcI1bt8v/oeGweDgxO71EbIy4E9DP1uOQcGekRXXfeSpLWiIDRmQp
         Aadd1QxS6qMyhGjiPWY/E+tzC9sSUqQMDzqz8ph8LidByFYX4L4I7olbrGj4Sm5Nx7jS
         vq4hJnM6/oGlOxSjb93J/G0pY9JeoNlBlwIO+o47NUnlGN2J9HgKifFc/JNz073F30Be
         xTZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id f35si384277plh.152.2019.03.13.12.57.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2019 12:57:20 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E204289DA9;
	Wed, 13 Mar 2019 19:57:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE82189DA9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 13 Mar 2019 19:57:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 453CE8124F;
 Wed, 13 Mar 2019 19:57:17 +0000 (UTC)
Received: from w520.home (ovpn-116-24.phx2.redhat.com [10.3.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64AE95D73F;
 Wed, 13 Mar 2019 19:57:14 +0000 (UTC)
Date: Wed, 13 Mar 2019 13:57:13 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190313135713.3fe001f5@w520.home>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19C985486@SHSMSX104.ccr.corp.intel.com>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190221134051.2c28893e@w520.home>
 <20190225022255.GP16456@joy-OptiPlex-7040>
 <20190307104421.534ea56f@w520.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19C97CA6B@SHSMSX104.ccr.corp.intel.com>
 <20190308091133.3073f5db@x1.home> <20190308162146.GD2834@work-vm>
 <20190308150254.3d1af7d8@x1.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19C983C63@SHSMSX104.ccr.corp.intel.com>
 <20190311141919.0c675efc@x1.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19C985486@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 13 Mar 2019 19:57:18 +0000 (UTC)
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
 "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Wang, 
 Zhi A" <zhi.a.wang@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAxMiBNYXIgMjAxOSAwMjo0ODozOSArMDAwMAoiVGlhbiwgS2V2aW4iIDxrZXZpbi50
aWFuQGludGVsLmNvbT4gd3JvdGU6Cgo+ID4gRnJvbTogQWxleCBXaWxsaWFtc29uIFttYWlsdG86
YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb21dCj4gPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAxMiwg
MjAxOSA0OjE5IEFNCj4gPiBPbiBNb24sIDExIE1hciAyMDE5IDAyOjMzOjExICswMDAwCj4gPiAi
VGlhbiwgS2V2aW4iIDxrZXZpbi50aWFuQGludGVsLmNvbT4gd3JvdGU6Cj4gPiAgIAo+IFsuLi5d
Cj4gPiAKPiA+IEkgdGhpbmsgSSd2ZSBmdWxseSBjb25jZWRlZCBhbnkgbm90aW9uIG9mIHNlY3Vy
aXR5IGJ5IG9ic2N1cml0eSB0b3dhcmRzCj4gPiBvcGFxdWUgZGF0YSBhbHJlYWR5LCBidXQgc2Vn
cmVnYXRpbmcgdHlwZXMgb2YgZGV2aWNlIGRhdGEgc3RpbGwgc2VlbXMKPiA+IHRvIHVubmVjZXNz
YXJpbHkgaW1wb3NlIGEgdXNhZ2UgbW9kZWwgb24gdGhlIHZlbmRvciBkcml2ZXIgdGhhdCBJIHRo
aW5rCj4gPiB3ZSBzaG91bGQgdHJ5IHRvIGF2b2lkLiAgVGhlIG1pZ3JhdGlvbiBpbnRlcmZhY2Ug
c2hvdWxkIGRlZmluZSB0aGUKPiA+IHByb3RvY29sIHRocm91Z2ggd2hpY2ggdXNlcnNwYWNlIGNh
biBzYXZlIGFuZCByZXN0b3JlIHRoZSBkZXZpY2Ugc3RhdGUsCj4gPiBub3QgaW1wb3NlIGhvdyB0
aGUgdmVuZG9yIGRyaXZlciBleHBvc2VzIG9yIG1hbmFnZXMgdGhhdCBzdGF0ZS4gIEFsc28sIEkK
PiA+IGdvdCB0aGUgaW1wcmVzc2lvbiAocGVyaGFwcyBpbmNvcnJlY3RseSkgdGhhdCB5b3Ugd2Vy
ZSB0cnlpbmcgdG8gbW1hcAo+ID4gbGl2ZSBkYXRhIHRvIHVzZXJzcGFjZSwgd2hpY2ggd291bGQg
YWxsb3cgbm90IG9ubHkgc2F2aW5nIHRoZSBzdGF0ZSwKPiA+IGJ1dCBhbHNvIHVuY2hlY2tlZCBz
dGF0ZSBtb2RpZmljYXRpb24gYnkgdXNlcnNwYWNlLiBJIHRoaW5rIHdlIHdhbnQKPiA+IG1vcmUg
b2YgYSBwcm9kdWNlci9jb25zdW1lciBtb2RlbCBvZiB0aGUgc3RhdGUgd2hlcmUgY29uc3VtaW5n
IHN0YXRlCj4gPiBhbHNvIGludm9sdmVzIGF0IGxlYXN0IHNvbWUgZGVncmVlIG9mIHNhbml0eSBv
ciBjb25zaXN0ZW5jeSBjaGVja2luZy4KPiA+IExldCdzIG5vdCBmb3JnZXQgdG9vIHRoYXQgd2Un
cmUgb2J2aW91c2x5IGRlYWxpbmcgd2l0aCBub24tb3BlbiBzb3VyY2UKPiA+IGRyaXZlciBpbiB0
aGUgbWRldiB1bml2ZXJzZSBhcyB3ZWxsLiAgCj4gCj4gT0suIEkgdGhpbmsgZm9yIHRoaXMgcGFy
dCB3ZSBhcmUgaW4gYWdyZWVtZW50IC0gYXMgbG9uZyBhcyB0aGUgZ29hbCBvZgo+IHRoaXMgaW50
ZXJmYWNlIGlzIGNsZWFybHkgZGVmaW5lZCBhcyBzdWNoIHdheS4gOi0pCj4gCj4gWy4uLl0KPiA+
ID4gQnV0IEkgc3RpbGwgZGlkbid0IGdldCB5b3VyIGV4YWN0IGNvbmNlcm4gYWJvdXQgc2VjdXJp
dHkgcGFydC4gRm9yCj4gPiA+IHZlcnNpb24geWVzIHdlIHN0aWxsIGhhdmVuJ3Qgd29ya2VkIG91
dCBhIHNhbmUgd2F5IHRvIHJlcHJlc2VudAo+ID4gPiB2ZW5kb3Itc3BlY2lmaWMgY29tcGF0aWJp
bGl0eSByZXF1aXJlbWVudC4gQnV0IGFsbG93aW5nIHVzZXIKPiA+ID4gc3BhY2UgdG8gbW9kaWZ5
IGRhdGEgdGhyb3VnaCB0aGlzIGludGVyZmFjZSBoYXMgcmVhbGx5IG5vIGRpZmZlcmVuY2UKPiA+
ID4gZnJvbSBhbGxvd2luZyBndWVzdCB0byBtb2RpZnkgZGF0YSB0aHJvdWdoIHRyYXBwZWQgTU1J
TyBpbnRlcmZhY2UuCj4gPiA+IG1kZXYgZHJpdmVyIHNob3VsZCBndWFyYW50ZWUgdGhhdCBvcGVy
YXRpb25zIHRocm91Z2ggYm90aCBpbnRlcmZhY2VzCj4gPiA+IGNhbiBtb2RpZnkgb25seSB0aGUg
c3RhdGUgYXNzb2NpYXRlZCB3aXRoIHRoZSBzYWlkIG1kZXYgaW5zdGFuY2UsCj4gPiA+IHcvbyBi
cmVha2luZyB0aGUgaXNvbGF0aW9uIGJvdW5kYXJ5LiBUaGVuIHRoZSBmb3JtZXIgYmVjb21lcyBq
dXN0Cj4gPiA+IGEgYmF0Y2ggb2Ygb3BlcmF0aW9ucyB0byBiZSB2ZXJpZmllZCBpbiB0aGUgc2Ft
ZSB3YXkgYXMgaWYgdGhleSBhcmUKPiA+ID4gZG9uZSBpbmRpdmlkdWFsbHkgdGhyb3VnaCB0aGUg
bGF0dGVyIGludGVyZmFjZS4gIAo+ID4gCj4gPiBJdCBzZWVtcyBsaWtlIHlvdSdyZSBhc3N1bWlu
ZyBhIHdvcmtpbmcgbW9kZWwgZm9yIHRoZSB2ZW5kb3IgZHJpdmVyIGFuZAo+ID4gdGhlIGRhdGEg
ZW50ZXJpbmcgYW5kIGV4aXRpbmcgdGhyb3VnaCB0aGlzIGludGVyZmFjZS4gIFRoZSB2ZW5kb3IK
PiA+IGRyaXZlcnMgY2FuIGV4cG9zZSBkYXRhIGFueSB3YXkgdGhhdCB0aGV5IHdhbnQuICBBbGwg
d2UgbmVlZCB0byBkbyBpcwo+ID4gaW1hZ2luZSB0aGF0IHRoZSBtaWdyYXRpb24gZGF0YSBzdHJl
YW0gaW5jbHVkZXMgYW4gYXJyYXkgaW5kZXggY291bnQKPiA+IHNvbWV3aGVyZSB3aGljaCB0aGUg
dXNlciBjb3VsZCBtb2RpZnkgdG8gdHJpZ2dlciB0aGUgaW4ta2VybmVsIHZlbmRvcgo+ID4gZHJp
dmVyIHRvIGFsbG9jYXRlIGFuIGFic3VyZCBhcnJheSBzaXplIGFuZCBEb1MgdGhlIHRhcmdldC4g
IFRoaXMgaXMKPiA+IHByb2JhYmx5IHRoZSBtb3N0IHNpbXBsaXN0aWMgYXR0YWNrLCBwb3NzaWJs
eSBrbm93aW5nIHRoZSBzdGF0ZSBtYWNoaW5lCj4gPiBvZiB0aGUgdmVuZG9yIGRyaXZlciBhIG1h
bGljaW91cyB1c2VyIGNvdWxkIHRyaWNrIGl0IGludG8gcHJvdmlkaW5nCj4gPiBob3N0IGtlcm5l
bCBkYXRhLiAgV2UncmUgbm90IG5lY2Vzc2FyaWx5IG9ubHkgY29udmV5aW5nIHN0YXRlIHRoYXQg
dGhlCj4gPiB1c2VyIGFscmVhZHkgaGFzIGFjY2VzcyB0byB2aWEgdGhpcyBpbnRlcmZhY2UsIHRo
ZSB2ZW5kb3IgZHJpdmVyIG1heQo+ID4gaW5jbHVkZSBub24tdmlzaWJsZSBpbnRlcm5hbCBzdGF0
ZSBhcyB3ZWxsLiAgRXZlbiB0aGUgc3RhdGUgdGhhdCBpcwo+ID4gdXNlciBhY2Nlc3NpYmxlIGlz
IGJlaW5nIHB1c2hlZCBpbnRvIHRoZSB2ZW5kb3IgZHJpdmVyIHZpYSBhbiBhbHRlcm5hdGUKPiA+
IHBhdGggZnJvbSB0aGUgdXNlciBtZWRpYXRpb24gd2UgaGF2ZSBvbiB0aGUgZXhpc3RpbmcgcGF0
aHMuICAKPiAKPiBUaGVuIEkgZG9uJ3Qga25vdyBob3cgdGhpcyBjb25jZXJuIGNhbiBiZSBlZmZl
Y3RpdmVseSBhZGRyZXNzZWQgCj4gc2luY2UgeW91IGFzc3VtZSB2ZW5kb3IgZHJpdmVycyBhcmUg
bm90IHRydXN0ZWQgaGVyZS4gYW5kIHdoeSBkbwo+IHlvdSB0cnVzdCB2ZW5kb3IgZHJpdmVycyBv
biBtZWRpYXRpbmcgZXhpc3RpbmcgcGF0aCBidXQgbm90IHRoaXMKPiBhbHRlcm5hdGl2ZSBvbmU/
IG5vbi12aXNpYmxlIGludGVybmFsIHN0YXRlcyBqdXN0IG1lYW4gbW9yZSBzdHVmZgo+IHRvIGJl
IGNhcmVmdWxseSBzY3J1dGluaXplZCwgd2hpY2ggaXMgbm90IGVzc2VudGlhbGx5IGNhdXNpbmcg
YSAKPiBjb25jZXB0dWFsIGRpZmZlcmVuY2Ugb2YgdHJ1c3QgbGV2ZWwuCj4gCj4gT3IgY2FuIHRo
aXMgY29uY2VybiBiZSBwYXJ0aWFsbHkgbWl0aWdhdGVkIGlmIHdlIGNyZWF0ZSBzb21lIAo+IHRl
c3QgY2FzZXMgd2hpY2ggcG9rZSByYW5kb20gZGF0YSB0aHJvdWdoIHRoZSBuZXcgaW50ZXJmYWNl
LAo+IGFuZCBtYXJrIHZlbmRvciBkcml2ZXJzIHdoaWNoIHBhc3Mgc3VjaCB0ZXN0cyBhcyB0cnVz
dGVkPyBUaGVuCj4gdGhlcmUgaXMgYWxzbyBhbiBvcGVuIHdobyBzaG91bGQgYmUgaW4gY2hhcmdl
IG9mIHN1Y2ggY2VydGlmaWNhdGlvbiAKPiBwcm9jZXNzLi4uCgpUaGUgdmVuZG9yIGRyaXZlciBp
cyBuZWNlc3NhcmlseSB0cnVzdGVkLCBpdCBsaXZlcyBpbiB0aGUga2VybmVsLCBpdAp3b3JrcyBp
biB0aGUga2VybmVsIGFkZHJlc3Mgc3BhY2UuICBVbmZvcnR1bmF0ZWx5IHRoYXQncyBhbHNvIHRo
ZSByaXNrCndpdGggcGFzc2luZyBkYXRhIGZyb20gdXNlcnNwYWNlIGludG8gdGhlIHZlbmRvciBk
cml2ZXIsIHRoZSB2ZW5kb3IKZHJpdmVyIG5lZWRzIHRvIHRha2UgZXZlcnkgcHJlY2F1dGlvbiBp
biBzYW5pdGl6aW5nIGFuZCB2YWxpZGF0aW5nIHRoYXQKZGF0YS4gIEkgd2lzaCB3ZSBoYWQgYSBj
b21tb24gd2F5IHRvIHBlcmZvcm0gdGhhdCBjaGVja2luZywgYnV0IGl0CnNlZW1zIHRoYXQgZWFj
aCB2ZW5kb3IgZHJpdmVyIGlzIGdvaW5nIHRvIG5lZWQgdG8gZGVmaW5lIHRoZWlyIG93bgpwcm90
b2NvbCBhbmQgYmF0dGxlIHRoZWlyIG93biBidWdzIGFuZCBleHBsb2l0cyBpbiB0aGUgY29kZQpp
bXBsZW1lbnRpbmcgdGhhdCBwcm90b2NvbC4gIEZvciBvcGVuIHNvdXJjZSBkcml2ZXJzIHdlIGNh
biBjb250aW51ZSB0bwpyZWx5IG9uIHJldmlldyBhbmQgb3Blbm5lc3MsIGZvciBjbG9zZWQgZHJp
dmVycy4uLiB0aGUgdXNlciBoYXMgYWxyZWFkeQphY2NlcHRlZCB0aGUgcmlzayB0byB0cnVzdCB0
aGUgZHJpdmVyIHRoZW1zZWx2ZXMuICBQZXJoYXBzIGFsbCBJIGNhbiBkbwppcyByYWlzZSB0aGUg
dmlzaWJpbGl0eSB0aGF0IHRoZXJlIGFyZSBwb3RlbnRpYWwgc2VjdXJpdHkgaXNzdWVzIGhlcmUK
YW5kIHZlbmRvciBkcml2ZXJzIG5lZWQgdG8gb3duIHRoYXQgcmlzay4KCkEgZnV6emluZyB0ZXN0
IHdvdWxkIGJlIGdyZWF0LCB3ZSBjb3VsZCBhdCBsZWFzdCB2YWxpZGF0ZSB3aGV0aGVyIGEKdmVu
ZG9yIGRyaXZlciBpbXBsZW1lbnRzIHNvbWUgc29ydCBvZiBDUkMgdGVzdCwgYnV0IEkgZG9uJ3Qg
dGhpbmsgd2UKY2FuIGNyZWF0ZSBhIGNlcnRpZmljYXRpb24gcHJvY2VzcyBhcm91bmQgdGhhdC4g
IFRoYW5rcywKCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1ndnQtZGV2
