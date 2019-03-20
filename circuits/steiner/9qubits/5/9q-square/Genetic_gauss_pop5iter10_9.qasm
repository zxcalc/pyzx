// Initial wiring: [0 1 2 4 5 8 6 7 3]
// Resulting wiring: [0 1 2 4 5 8 7 6 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[5], q[0];
cx q[6], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[1], q[4];
cx q[5], q[6];
cx q[2], q[3];
