// Initial wiring: [0 2 3 1 4 5 6 7 8]
// Resulting wiring: [0 2 3 1 4 5 6 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[8], q[3];
cx q[7], q[6];
