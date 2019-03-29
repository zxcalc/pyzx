// Initial wiring: [7, 14, 10, 9, 19, 5, 15, 11, 1, 12, 17, 2, 3, 4, 0, 8, 18, 6, 13, 16]
// Resulting wiring: [7, 14, 10, 9, 19, 5, 15, 11, 1, 12, 17, 2, 3, 4, 0, 8, 18, 6, 13, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[10], q[9];
cx q[12], q[7];
cx q[7], q[2];
cx q[16], q[14];
cx q[16], q[13];
cx q[17], q[16];
cx q[16], q[14];
cx q[17], q[11];
cx q[12], q[17];
cx q[8], q[9];
cx q[7], q[12];
cx q[12], q[18];
cx q[12], q[17];
cx q[6], q[13];
cx q[4], q[5];
cx q[5], q[14];
cx q[14], q[15];
