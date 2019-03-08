Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp8196951ywe;
        Fri, 8 Mar 2019 08:21:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqxx3ttCXvUx1rMPaqPkFJxN2hkO65CoCOUmp6pzqlcwCg9/ULeHS6fg/z1mc1HozTDi4w1e
X-Received: by 2002:a62:4e8a:: with SMTP id c132mr19033969pfb.24.1552062118142;
        Fri, 08 Mar 2019 08:21:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552062118; cv=none;
        d=google.com; s=arc-20160816;
        b=YyIvM2i8wwRLqI//AnNeUuwNV24KUs97ZjaBSAZn2+e3OBik64oWKDZt/0z1Ri5nj7
         fj4pN9ZixyJvYspKgjGmv5sybyfKkl+nEBz2ekQuyduegQY/2ChQ4uyAhHrt51WM+Fe0
         jADS19dGyd53FPF/SohMAZiStfp+Rb9Ojg0oYR+Jxr/SN/V6vhzu+du1HpxJxzenPLMj
         n7d2dFacGCBNYoI8odnAGKqtKQjVQ3nJHyMYi6eBSuDcdX6xQmHBA5793UblyrYkP+TF
         g1QVOnQv1nBNxCRjIob61ZfsLqwh1sfEYyfmctm9hQN+tizod3R7AV9IIjtv98BzYOVP
         /N0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=/PanPqz3OWc44awbmg40faQdtBr1byxvRrgyoRMqRjM=;
        b=cUKmjz5Xf0tQSBsx2xfb86shOookhTQb8GV5g+8aVJouofOAOA+3HNaTDO2i55umGy
         U8+OcPn6DmSRdJ1Ey/sBSxfEbYJ5ZM2DLkIIeKvk/7zbkCm39/gYFne/rgsuWKxNAhic
         QLe9aq1IpXhzcF4BU9ffZRBT7JAHAVirt5URMqoF329JVTZTL/7uBisOgmYefMPo4J7g
         SciVQDZU5GzIsd95vpAomQOo2s2yDQb60jqhtCqTEvB36atF/uo0ft455df13zj+WDld
         4OMmclWNAkVTVgSHtW1D2068g1ykS1obL0nhk/02MBzEFcHf3JWRDg4I/dG1m/5Xne5E
         FQOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id 17si6966622pgu.262.2019.03.08.08.21.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2019 08:21:58 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5976E3E2;
	Fri,  8 Mar 2019 16:21:57 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A776E3E2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 Mar 2019 16:21:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7BF7F30718D9;
 Fri,  8 Mar 2019 16:21:55 +0000 (UTC)
Received: from work-vm (ovpn-117-233.ams2.redhat.com [10.36.117.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C42460856;
 Fri,  8 Mar 2019 16:21:48 +0000 (UTC)
Date: Fri, 8 Mar 2019 16:21:46 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190308162146.GD2834@work-vm>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190221134051.2c28893e@w520.home>
 <20190225022255.GP16456@joy-OptiPlex-7040>
 <20190307104421.534ea56f@w520.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19C97CA6B@SHSMSX104.ccr.corp.intel.com>
 <20190308091133.3073f5db@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190308091133.3073f5db@x1.home>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 08 Mar 2019 16:21:55 +0000 (UTC)
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
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

KiBBbGV4IFdpbGxpYW1zb24gKGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tKSB3cm90ZToKPiBP
biBUaHUsIDcgTWFyIDIwMTkgMjM6MjA6MzYgKzAwMDAKPiAiVGlhbiwgS2V2aW4iIDxrZXZpbi50
aWFuQGludGVsLmNvbT4gd3JvdGU6Cj4gCj4gPiA+IEZyb206IEFsZXggV2lsbGlhbXNvbiBbbWFp
bHRvOmFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tXQo+ID4gPiBTZW50OiBGcmlkYXksIE1hcmNo
IDgsIDIwMTkgMTo0NCBBTSAgCj4gPiA+ID4gPiAgCj4gPiA+ID4gPiA+ICAgICAgICAgVGhpcyBr
aW5kIG9mIGRhdGEgbmVlZHMgdG8gYmUgc2F2ZWQgLyBsb2FkZWQgaW4gcHJlLWNvcHkgYW5kCj4g
PiA+ID4gPiA+ICAgICAgICAgc3RvcC1hbmQtY29weSBwaGFzZS4KPiA+ID4gPiA+ID4gICAgICAg
ICBUaGUgZGF0YSBvZiBkZXZpY2UgbWVtb3J5IGlzIGhlbGQgaW4gZGV2aWNlIG1lbW9yeSByZWdp
b24uCj4gPiA+ID4gPiA+ICAgICAgICAgU2l6ZSBvZiBkZXZpZSBtZW1vcnkgaXMgdXN1YWxseSBs
YXJnZXIgdGhhbiB0aGF0IG9mIGRldmljZQo+ID4gPiA+ID4gPiAgICAgICAgIG1lbW9yeSByZWdp
b24uIHFlbXUgbmVlZHMgdG8gc2F2ZS9sb2FkIGl0IGluIGNodW5rcyBvZiBzaXplIG9mCj4gPiA+
ID4gPiA+ICAgICAgICAgZGV2aWNlIG1lbW9yeSByZWdpb24uCj4gPiA+ID4gPiA+ICAgICAgICAg
Tm90IGFsbCBkZXZpY2UgaGFzIGRldmljZSBtZW1vcnkuIExpa2UgSUdEIG9ubHkgdXNlcyBzeXN0
ZW0gIAo+ID4gPiBtZW1vcnkuICAKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJdCBzZWVtcyBhIGxpdHRs
ZSBncmF0dWl0b3VzIHRvIG1lIHRoYXQgdGhpcyBpcyBhIHNlcGFyYXRlIHJlZ2lvbiBvcgo+ID4g
PiA+ID4gdGhhdCB0aGlzIGRhdGEgaXMgaGFuZGxlZCBzZXBhcmF0ZWx5LiAgQWxsIG9mIHRoaXMg
ZGF0YSBpcyBvcGFxdWUgdG8KPiA+ID4gPiA+IFFFTVUsIHNvIHdoeSBkbyB3ZSBuZWVkIHRvIHNl
cGFyYXRlIGl0PyAgCj4gPiA+ID4gaGkgQWxleCwKPiA+ID4gPiBhcyB0aGUgZGV2aWNlIHN0YXRl
IGludGVyZmFjZXMgYXJlIHByb3ZpZGVkIGJ5IGtlcm5lbCwgaXQgaXMgZXhwZWN0ZWQgdG8KPiA+
ID4gPiBtZWV0IGFzIGdlbmVyYWwgbmVlZHMgYXMgcG9zc2libGUuIFNvLCBkbyB5b3UgdGhpbmsg
dGhlcmUgYXJlIHN1Y2ggdXNlCj4gPiA+ID4gY2FzZXMgZnJvbSB1c2VyIHNwYWNlIHRoYXQgdXNl
ciBzcGFjZSBrbm93cyB3ZWxsIG9mIHRoZSBkZXZpY2UsIGFuZAo+ID4gPiA+IGl0IHdhbnRzIGtl
cm5lbCB0byByZXR1cm4gZGVzaXJlZCBkYXRhIGJhY2sgdG8gaXQuCj4gPiA+ID4gRS5nLiBJdCBq
dXN0IHdhbnRzIHRvIGdldCB3aG9sZSBkZXZpY2UgY29uZmlnIGRhdGEgaW5jbHVkaW5nIGFsbCBt
bWlvcywKPiA+ID4gPiBwYWdlIHRhYmxlcywgcGNpIGNvbmZpZyBkYXRhLi4uCj4gPiA+ID4gb3Is
IEl0IGp1c3Qgd2FudHMgdG8gZ2V0IGN1cnJlbnQgZGV2aWNlIG1lbW9yeSBzbmFwc2hvdCwgbm90
IGluY2x1ZGluZyBhbnkKPiA+ID4gPiBkaXJ0eSBkYXRhLgo+ID4gPiA+IE9yLCBJdCBqdXN0IG5l
ZWRzIHRoZSBkaXJ0eSBwYWdlcyBpbiBkZXZpY2UgbWVtb3J5IG9yIHN5c3RlbSBtZW1vcnkuCj4g
PiA+ID4gV2l0aCBhbGwgdGhpcyBhY2N1cmF0ZSBxdWVyeSwgcXVpdGUgYSBsb3Qgb2YgdXNlZnVs
IGZlYXR1cmVzIGNhbiBiZQo+ID4gPiA+IGRldmVsb3BwZWQgaW4gdXNlciBzcGFjZS4KPiA+ID4g
Pgo+ID4gPiA+IElmIGFsbCBvZiB0aGlzIGRhdGEgaXMgb3BhcXVlIHRvIHVzZXIgYXBwLCBzZWVt
cyB0aGUgb25seSB1c2UgY2FzZSBpcwo+ID4gPiA+IGZvciBsaXZlIG1pZ3JhdGlvbi4gIAo+ID4g
PiAKPiA+ID4gSSBjYW4gY2VydGFpbmx5IGFwcHJlY2lhdGUgYSBtb3JlIHZlcnNhdGlsZSBpbnRl
cmZhY2UsIGJ1dCBJIHRoaW5rCj4gPiA+IHdlJ3JlIGFsc28gdHJ5aW5nIHRvIGNyZWF0ZSB0aGUg
bW9zdCBzaW1wbGUgaW50ZXJmYWNlIHdlIGNhbiwgd2l0aCB0aGUKPiA+ID4gcHJpbWFyeSB0YXJn
ZXQgYmVpbmcgbGl2ZSBtaWdyYXRpb24uICBBcyBzb29uIGFzIHdlIHN0YXJ0IGRlZmluaW5nIHRo
aXMKPiA+ID4gdHlwZSBvZiBkZXZpY2UgbWVtb3J5IGFuZCB0aGF0IHR5cGUgb2YgZGV2aWNlIG1l
bW9yeSwgd2UncmUgZ29pbmcgdG8KPiA+ID4gaGF2ZSBhbm90aGVyIGRldmljZSBjb21lIGFsb25n
IHRoYXQgbmVlZHMgeWV0IGFub3RoZXIgYmVjYXVzZSB0aGV5IGhhdmUKPiA+ID4gYSBzbGlnaHRs
eSBkaWZmZXJlbnQgcmVxdWlyZW1lbnQuICBFdmVuIHdpdGhvdXQgdGhhdCwgd2UncmUgZ29pbmcg
dG8KPiA+ID4gaGF2ZSB2ZW5kb3IgZHJpdmVycyBpbXBsZW1lbnQgaXQgZGlmZmVyZW50bHksIHNv
IHdoYXQgd29ya3MgZm9yIG9uZQo+ID4gPiBkZXZpY2UgZm9yIGEgbW9yZSB0YXJnZXRlZCBhcHBy
b2FjaCBtYXkgbm90IHdvcmsgZm9yIGFsbCBkZXZpY2VzLiAgQ2FuCj4gPiA+IHlvdSBlbnVtZXJh
dGUgc29tZSBzcGVjaWZpYyBleGFtcGxlcyBvZiB0aGUgdXNlIGNhc2VzIHlvdSBpbWFnaW5lIHlv
dXIKPiA+ID4gZGVzaWduIHRvIGVuYWJsZT8KPiA+ID4gICAKPiA+IAo+ID4gRG8gd2Ugd2FudCB0
byBjb25zaWRlciBhbiB1c2UgY2FzZSB3aGVyZSB1c2VyIHNwYWNlIHdvdWxkIGxpa2UgdG8KPiA+
IHNlbGVjdGl2ZWx5IGludHJvc3BlY3QgYSBwb3J0aW9uIG9mIHRoZSBkZXZpY2Ugc3RhdGUgKGlu
Y2x1ZGluZyBpbXBsaWNpdCAKPiA+IHN0YXRlIHdoaWNoIGFyZSBub3QgYXZhaWxhYmxlIHRocm91
Z2ggUENJIHJlZ2lvbnMpLCBhbmQgbWF5IGFzayBmb3IKPiA+IGNhcGFiaWxpdHkgb2YgZGlyZWN0
IG1hcHBpbmcgb2Ygc2VsZWN0ZWQgcG9ydGlvbiBmb3Igc2Nhbm5pbmcgKGUuZy4KPiA+IGRldmlj
ZSBtZW1vcnkpIGluc3RlYWQgb2YgYWx3YXlzIHR1cm5pbmcgb24gZGlydHkgbG9nZ2luZyBvbiBh
bGwKPiA+IGRldmljZSBzdGF0ZT8KPiAKPiBJIGRvbid0IHNlZSB0aGF0IGEgbWlncmF0aW9uIGlu
dGVyZmFjZSBuZWNlc3NhcmlseSBsZW5kcyBpdHNlbGYgdG8gdGhpcwo+IHVzZSBjYXNlLiAgQSBt
aWdyYXRpb24gZGF0YSBzdHJlYW0gaGFzIG5vIHJlcXVpcmVtZW50IHRvIGJlIHVzZXIKPiBjb25z
dW1hYmxlIGFzIGFueXRoaW5nIG90aGVyIHRoYW4gb3BhcXVlIGRhdGEsIHRoZXJlJ3MgYWxzbyBu
bwo+IHJlcXVpcmVtZW50IHRoYXQgaXQgZXhwb3NlIHN0YXRlIGluIGEgZm9ybSB0aGF0IGRpcmVj
dGx5IHJlcHJlc2VudHMgdGhlCj4gaW50ZXJuYWwgc3RhdGUgb2YgdGhlIGRldmljZS4gIEluIGZh
Y3QgSSdtIG5vdCBzdXJlIHdlIHdhbnQgdG8gZW5jb3VyYWdlCj4gaW50cm9zcGVjdGlvbiB2aWEg
dGhpcyBkYXRhIHN0cmVhbS4gIElmIGEgdXNlciBrbm93cyBob3cgdG8gaW50ZXJwcmV0Cj4gdGhl
IGRhdGEsIHdoYXQgcHJldmVudHMgdGhlbSBmcm9tIG1vZGlmeWluZyB0aGUgZGF0YSBpbi1mbGln
aHQ/ICBJJ3ZlCj4gcmFpc2VkIHRoZSBxdWVzdGlvbiBwcmV2aW91c2x5IHJlZ2FyZGluZyBob3cg
dGhlIHZlbmRvciBkcml2ZXIgY2FuCj4gdmFsaWRhdGUgdGhlIGludGVncml0eSBvZiB0aGUgbWln
cmF0aW9uIGRhdGEgc3RyZWFtLiAgVXNpbmcgdGhlCj4gbWlncmF0aW9uIGludGVyZmFjZSB0byBp
bnRyb3NwZWN0IHRoZSBkZXZpY2UgY2VydGFpbmx5IHN1Z2dlc3RzIGFuCj4gaW50ZXJmYWNlIHJp
cGUgZm9yIGV4cGxvaXRpbmcgYW55IHBvdGVudGlhbCB3ZWFrbmVzcyBpbiB0aGUgdmVuZG9yCj4g
ZHJpdmVyIHJlYXNzZW1ibGluZyB0aGF0IG1pZ3JhdGlvbiBzdHJlYW0uICBJZiB0aGUgdXNlciBo
YXMgYW4gbW1hcCB0bwo+IHRoZSBhY3R1YWwgbGl2ZSB3b3JraW5nIHN0YXRlIG9mIHRoZSB2ZW5k
b3IgZHJpdmVyLCBwcm90ZWN0aW9uIGluIHRoZQo+IGhhcmR3YXJlIHNlZW1zIGxpa2UgdGhlIG9u
bHkgd2F5IHlvdSBjb3VsZCBwcm90ZWN0IGFnYWluc3QgYSBtYWxpY2lvdXMKPiB1c2VyLiAgUGxl
YXNlIGJlIGRlZmVuc2l2ZSBpbiB3aGF0IGlzIGRpcmVjdGx5IGV4cG9zZWQgdG8gdGhlIHVzZXIg
YW5kCj4gd2hhdCBzYWZlZ3VhcmRzIGFyZSBpbiBwbGFjZSB3aXRoaW4gdGhlIHZlbmRvciBkcml2
ZXIgZm9yIHZhbGlkYXRpbmcKPiBpbmNvbWluZyBkYXRhLiAgVGhhbmtzLAoKSG1tOyB0aGF0IHNv
dW5kcyBsaWtlIGEgc2VjdXJpdHktYnktb2JzY3VyaXR5IGFuc3dlciEKClRoZSBzY3JpcHRzL2Fu
YWx5emUtbWlncmF0aW9uLnB5IHNjcmlwdHMgd2lsbCBhY3R1YWxseSBkdW1wIHRoZQptaWdyYXRp
b24gc3RyZWFtIGRhdGEgaW4gYW4gYWxtb3N0IHJlYWRhYmxlIGZvcm1hdC4KU28gaWYgeW91IHBy
b3Blcmx5IGRlZmluZSB0aGUgVk1TdGF0ZSBkZWZpbml0aW9ucyBpdCBzaG91bGQgYmUgYWxtb3N0
CnJlYWRhYmxlOyBpdCdzIG9jY2FzaW9uYWxseSBiZWVuIHVzZWZ1bC4KCkkgYWdyZWUgdGhhdCB5
b3Ugc2hvdWxkIGJlIHZlcnkgdmVyeSBjYXJlZnVsIHRvIHZhbGlkYXRlIHRoZSBpbmNvbWluZwpt
aWdyYXRpb24gc3RyZWFtIGFnYWluc3Q6CiAgYSkgQ29ycnVwdGlvbgogIGIpIFdyb25nIGRyaXZl
ciB2ZXJzaW9ucwogIGMpIE1hbGljaW91cyBpbnRlbnQKICAgIGMuMSkgRXNwZWNpYWxseSBieSB0
aGUgZ3Vlc3QKICAgIGMuMikgT3IgYnkgc29tZW9uZSB0cnlpbmcgdG8gZmVlZCB5b3UgYSBkdWZm
IHN0cmVhbQogIGQpIFNvbWVvbmUgdHJ5aW5nIGxvYWQgdGhlIFZGSU8gc3RyZWFtIGludG8gY29t
cGxldGVseSB0aGUgd3JvbmcKZGV2aWNlLgoKV2hldGhlciB0aGUgbWlncmF0aW9uIGludGVyZmFj
ZSBpcyB0aGUgcmlnaHQgdGhpbmcgdG8gdXNlIGZvciB0aGF0Cmluc3BlY3Rpb24gaG1tOyB3ZWxs
IGl0IG1pZ2h0IGJlIC0gaWYgeW91J3JlIHRyeWluZyB0byBkZWJ1Zwp5b3VyIGRldmljZSBhbmQg
bmVlZCBhIGR1bXAgb2YgaXQncyBzdGF0ZSwgdGhlbiB3aHkgbm90PwooSSBndWVzcyB5b3UgZW5k
IHVwIHdpdGggc29tZXRoaW5nIG5vdCBkaXNzaW1pbGFyIHRvIHdoYXQgdGhpbmdzCmxpa2UgaW50
ZWtfcmVnX3NuYXBzaG90IGluIGludGVsLWdwdS10b29scyBkb2VzKS4KCkRhdmUKCj4gQWxleAot
LQpEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IC8gZGdpbGJlcnRAcmVkaGF0LmNvbSAvIE1hbmNoZXN0
ZXIsIFVLCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlu
dGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwt
Z3Z0LWRldg==
