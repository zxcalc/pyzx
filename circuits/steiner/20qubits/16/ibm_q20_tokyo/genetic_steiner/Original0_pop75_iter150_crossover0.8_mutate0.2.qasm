// Initial wiring: [5, 4, 1, 2, 7, 3, 12, 11, 6, 9, 15, 17, 14, 19, 10, 13, 8, 18, 0, 16]
// Resulting wiring: [5, 4, 1, 2, 7, 3, 12, 11, 6, 9, 15, 17, 14, 19, 10, 13, 8, 18, 0, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[10], q[9];
cx q[11], q[9];
cx q[12], q[7];
cx q[14], q[5];
cx q[16], q[14];
cx q[14], q[5];
cx q[5], q[3];
cx q[19], q[18];
cx q[18], q[17];
cx q[18], q[12];
cx q[15], q[16];
cx q[11], q[12];
cx q[6], q[12];
cx q[2], q[3];
