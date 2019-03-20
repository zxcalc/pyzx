// Initial wiring: [0 2 1 5 8 4 6 7 3]
// Resulting wiring: [0 2 1 5 8 4 6 7 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[5], q[6];
cx q[6], q[7];
cx q[0], q[1];
cx q[7], q[8];
