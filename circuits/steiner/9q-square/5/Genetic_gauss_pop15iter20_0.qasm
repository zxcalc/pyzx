// Initial wiring: [0 1 2 4 8 6 7 3 5]
// Resulting wiring: [0 1 2 4 3 6 7 8 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[2], q[3];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[5], q[6];
cx q[2], q[3];
cx q[7], q[4];
