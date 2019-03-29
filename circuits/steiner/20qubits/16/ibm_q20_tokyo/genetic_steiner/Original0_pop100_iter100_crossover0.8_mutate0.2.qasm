// Initial wiring: [7, 0, 18, 2, 4, 3, 1, 14, 16, 5, 15, 9, 11, 12, 10, 8, 13, 17, 6, 19]
// Resulting wiring: [7, 0, 18, 2, 4, 3, 1, 14, 16, 5, 15, 9, 11, 12, 10, 8, 13, 17, 6, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[3];
cx q[8], q[1];
cx q[12], q[7];
cx q[13], q[12];
cx q[14], q[5];
cx q[15], q[14];
cx q[14], q[5];
cx q[5], q[3];
cx q[16], q[15];
cx q[17], q[12];
cx q[12], q[7];
cx q[17], q[11];
cx q[18], q[12];
cx q[10], q[11];
cx q[7], q[12];
cx q[1], q[7];
cx q[1], q[2];
