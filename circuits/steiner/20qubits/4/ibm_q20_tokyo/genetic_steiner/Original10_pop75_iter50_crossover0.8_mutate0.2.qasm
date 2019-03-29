// Initial wiring: [17, 19, 18, 10, 14, 7, 0, 6, 4, 5, 15, 11, 12, 3, 9, 2, 16, 8, 13, 1]
// Resulting wiring: [17, 19, 18, 10, 14, 7, 0, 6, 4, 5, 15, 11, 12, 3, 9, 2, 16, 8, 13, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[12];
cx q[18], q[17];
cx q[7], q[8];
cx q[8], q[9];
