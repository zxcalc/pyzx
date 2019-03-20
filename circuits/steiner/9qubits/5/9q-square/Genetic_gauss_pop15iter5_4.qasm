// Initial wiring: [0 1 2 3 4 5 7 8 6]
// Resulting wiring: [0 1 2 3 4 5 7 8 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[4];
cx q[1], q[0];
cx q[1], q[2];
cx q[6], q[5];
cx q[8], q[3];
